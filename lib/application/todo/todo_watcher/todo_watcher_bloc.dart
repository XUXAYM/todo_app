import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/services/i_device_id_provider.dart';
import '../../../domain/todo/exceptions/cached_exceptions.dart';
import '../../../domain/todo/exceptions/network_exceptions.dart';
import '../../../domain/todo/i_todo_local_data_source.dart';
import '../../../domain/todo/i_todo_remote_data_source.dart';
import '../../../domain/todo/models/todo.dart';
import '../../../presentation/services/logger_controller.dart';

part 'todo_watcher_bloc.freezed.dart';
part 'todo_watcher_event.dart';
part 'todo_watcher_state.dart';

@injectable
class TodoWatcherBloc extends Bloc<TodoWatcherEvent, TodoWatcherState> {
  final ITodoLocalDataSource _localDataSource;
  final ITodoRemoteDataSource _remoteDataSource;
  final IDeviceIdProvider _deviceIdProvider;

  late final StreamSubscription _todoStreamSubscription;

  TodoWatcherBloc(
    ITodoLocalDataSource todoLocalDataSource,
    ITodoRemoteDataSource todoRemoteDataSource,
    IDeviceIdProvider deviceIdProvider,
  )   : _localDataSource = todoLocalDataSource,
        _remoteDataSource = todoRemoteDataSource,
        _deviceIdProvider = deviceIdProvider,
        super(TodoWatcherState.initial()) {
    on<_TodosFetched>(_todosFetched);
    on<_TodosRequested>(_todosRequested);
    on<_TodoDeleted>(_todoDeleted);
    on<_TodoToggled>(_todoToggled);
    on<_CompletedVisibilityChanged>(_completedVisibilityChanged);

    _todoStreamSubscription = _localDataSource.watch().listen((event) {
      LoggerController.logger.info('Local todo changes listen invoked');
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
          try {
            final remoteTodoData = await _remoteDataSource.getAll();
            await _localDataSource.replaceAll(remoteTodoData);

            emit(state.copyWith(
              todos: remoteTodoData.todos,
              exception: null,
              isLoading: false,
              initial: false,
            ));
          } on NetworkException catch (e, stackTrace) {
            LoggerController.logger
                .warning('Some problem with remote store', e, stackTrace);

            final localTodoData = await _localDataSource.getAll();

            emit(state.copyWith(
              todos: localTodoData.todos,
              exception: null,
              isLoading: false,
              initial: false,
            ));
          }
        },
      );

  FutureOr<void> _todosRequested(
    _TodosRequested event,
    Emitter<TodoWatcherState> emit,
  ) =>
      _performTodoInteractions(emit, () async {
        final localTodoData = await _localDataSource.getAll();

        emit(state.copyWith(
          todos: localTodoData.todos,
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
          final todoData = await _localDataSource.get(event.todo.id);

          await _localDataSource.delete(todoData);
          try {
            await _remoteDataSource.delete(todoData);
          } on NetworkException catch (e, stackTrace) {
            LoggerController.logger
                .warning('Some problem with remote store', e, stackTrace);
            await _localDataSource.setIsDurtyData(true);
          }
        },
      );

  FutureOr<void> _todoToggled(
    _TodoToggled event,
    Emitter<TodoWatcherState> emit,
  ) =>
      _performTodoInteractions(
        emit,
        () async {
          final localTodoData = await _localDataSource.get(event.todo.id);

          final todoData = localTodoData.copyWith(
            todo: localTodoData.todo.copyWith(
              done: !localTodoData.todo.done,
              changedAt: DateTime.now(),
              lastUpdatedBy: await _deviceIdProvider.getDeviceId(),
            ),
          );

          await _localDataSource.update(todoData);
          try {
            final remoteData = await _remoteDataSource.update(todoData);

            await _localDataSource.update(remoteData);
          } on NetworkException catch (e, stackTrace) {
            LoggerController.logger
                .warning('Some problem with remote store', e, stackTrace);
            await _localDataSource.setIsDurtyData(true);
          }
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
