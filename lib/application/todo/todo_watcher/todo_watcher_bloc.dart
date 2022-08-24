import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/todo/exceptions/repository_exceptions.dart';
import '../../../domain/todo/i_todo_repository.dart';
import '../../../domain/todo/models/todo.dart';
import '../../../presentation/services/logger_controller.dart';

part 'todo_watcher_bloc.freezed.dart';
part 'todo_watcher_event.dart';
part 'todo_watcher_state.dart';

@injectable
class TodoWatcherBloc extends Bloc<TodoWatcherEvent, TodoWatcherState> {
  final ITodoRepository _todoRepository;

  late final StreamSubscription _todoStreamSubscription;

  TodoWatcherBloc(
    ITodoRepository todoRepository,
  )   : _todoRepository = todoRepository,
        super(TodoWatcherState.initial()) {
    on<_TodosFetched>(_todosFetched);
    on<_TodosRequested>(_todosRequested);
    on<_TodoDeleted>(_todoDeleted);
    on<_TodoToggled>(_todoToggled);
    on<_CompletedVisibilityChanged>(_completedVisibilityChanged);

    _todoStreamSubscription = _todoRepository.watch().listen((event) {
      LoggerController.logger.info('Todo changes listen invoked');
      add(const TodoWatcherEvent.todosRequested());
    });
  }

  FutureOr<void> _todosFetched(
    _TodosFetched event,
    Emitter<TodoWatcherState> emit,
  ) =>
      _performTodoInteractions(
        emit,
        () async {
          final todos = await _todoRepository.getAll();

          emit(state.copyWith(
            todos: todos,
            exception: null,
            isLoading: false,
            initial: false,
          ));
        },
      );

  FutureOr<void> _todosRequested(
    _TodosRequested event,
    Emitter<TodoWatcherState> emit,
  ) =>
      _performTodoInteractions(emit, () async {
        final localTodos = await _todoRepository.getAll(true);

        emit(state.copyWith(
          todos: localTodos,
          exception: null,
          isLoading: false,
          initial: false,
        ));
      });

  FutureOr<void> _todoDeleted(
    _TodoDeleted event,
    Emitter<TodoWatcherState> emit,
  ) =>
      _performTodoInteractions(
        emit,
        () async {
          await _todoRepository.delete(event.todo);
        },
      );

  FutureOr<void> _todoToggled(
    _TodoToggled event,
    Emitter<TodoWatcherState> emit,
  ) =>
      _performTodoInteractions(
        emit,
        () async {
          _todoRepository.update(event.todo.copyWith(done: !event.todo.done));
        },
      );

  FutureOr<void> _completedVisibilityChanged(
    _CompletedVisibilityChanged event,
    Emitter<TodoWatcherState> emit,
  ) {
    emit(state.copyWith(hideCompleted: !state.hideCompleted));
  }

  FutureOr<void> _performTodoInteractions(
    Emitter<TodoWatcherState> emit,
    FutureOr<void> Function() executingBody,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      exception: null,
      initial: false,
    ));

    try {
      await executingBody();
    } on RepositoryException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with repository', e, stackTrace);

      emit(state.copyWith(
        isLoading: false,
        exception: e,
      ));
    } on Object catch (e, stackTrace) {
      LoggerController.logger.warning('Unexpected exception', e, stackTrace);

      emit(state.copyWith(
        isLoading: false,
        exception: e as Exception?,
      ));

      rethrow;
    }
  }

  @override
  Future<void> close() async {
    await _todoStreamSubscription.cancel();
    await super.close();
  }
}
