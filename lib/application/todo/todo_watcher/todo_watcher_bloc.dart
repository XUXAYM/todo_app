import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/todo/exceptions/cached_exceptions.dart';
import '../../../domain/todo/i_todo_local_data_source.dart';
import '../../../domain/todo/i_todo_remote_data_source.dart';
import '../../../domain/todo/models/todo.dart';
import '../../../domain/todo/models/todo_data.dart';
import '../../../presentation/services/logger_controller.dart';

part 'todo_watcher_bloc.freezed.dart';
part 'todo_watcher_event.dart';
part 'todo_watcher_state.dart';

@injectable
class TodoWatcherBloc extends Bloc<TodoWatcherEvent, TodoWatcherState> {
  final ITodoLocalDataSource _localDataSource;
  // TODO: Implement remote interactions
  final ITodoRemoteDataSource _remoteDataSource;

  late final StreamSubscription _todoStreamSubscription;

  TodoWatcherBloc(
    ITodoLocalDataSource todoLocalDataSource,
    ITodoRemoteDataSource todoRemoteDataSource,
  )   : _localDataSource = todoLocalDataSource,
        _remoteDataSource = todoRemoteDataSource,
        super(TodoWatcherState.initial()) {
    on<_TodosRequested>(_todosRequested);
    on<_TodoDeleted>(_todoDeleted);
    on<_TodoToggled>(_todoToggled);
    on<_CompletedVisibilityChanged>(_completedVisibilityChanged);

    _todoStreamSubscription = _localDataSource.watch().listen((event) {
      LoggerController.logger.info('Local todo changes listen invoked');
      add(const TodoWatcherEvent.todosRequested());
    });
  }

  FutureOr<void> _todosRequested(
    _TodosRequested event,
    Emitter<TodoWatcherState> emit,
  ) =>
      _performTodoInteractions(
        emit,
        () async {
          final localTodoData = await _localDataSource.getAll();

          emit(state.copyWith(
            todos: localTodoData.todos,
            exception: null,
            isLoading: false,
          ));
        },
      );

  FutureOr<void> _todoDeleted(
    _TodoDeleted event,
    Emitter<TodoWatcherState> emit,
  ) =>
      _performTodoInteractions(
        emit,
        () async {
          final localRevision = await _localDataSource.getRevision();
          final todoData =
              TodoData.single(todo: event.todo, revision: localRevision);

          await _localDataSource.delete(todoData as SingleTodoData);
        },
      );

  FutureOr<void> _todoToggled(
    _TodoToggled event,
    Emitter<TodoWatcherState> emit,
  ) =>
      _performTodoInteractions(
        emit,
        () async {
          final localRevision = await _localDataSource.getRevision();
          final todoData = TodoData.single(
            todo: event.todo.copyWith(
              done: !event.todo.done,
              changedAt: DateTime.now(),
            ),
            revision: localRevision,
          );

          await _localDataSource.update(todoData as SingleTodoData);
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
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with todo localy storage', e, stackTrace);

      emit(state.copyWith(
        isLoading: false,
        exception: e,
      ));
    }
  }

  @override
  Future<void> close() async {
    await _todoStreamSubscription.cancel();
    await super.close();
  }
}
