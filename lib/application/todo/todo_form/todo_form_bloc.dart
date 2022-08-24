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
import '../../../domain/todo/models/todo_data.dart';
import '../../../presentation/services/logger_controller.dart';
import '../../core/methods.dart';

part 'todo_form_bloc.freezed.dart';
part 'todo_form_event.dart';
part 'todo_form_state.dart';

const Duration _duration = Duration(milliseconds: 150);

@injectable
class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  final ITodoLocalDataSource _localDataSource;
  final ITodoRemoteDataSource _remoteDataSource;
  final IDeviceIdProvider _deviceIdProvider;

  TodoFormBloc(
    @factoryParam Todo? todo,
    ITodoLocalDataSource todoLocalDataSource,
    ITodoRemoteDataSource todoRemoteDataSource,
    IDeviceIdProvider deviceIdProvider,
  )   : _localDataSource = todoLocalDataSource,
        _remoteDataSource = todoRemoteDataSource,
        _deviceIdProvider = deviceIdProvider,
        super(TodoFormState.initial(todo)) {
    on<_TextChanged>(_textChanged, transformer: debounce(_duration));
    on<_ImportanceChanged>(_importanceChanged);
    on<_DeadlineChanged>(_deadlineChanged);
    on<_SavePressed>(_savePressed);
    on<_DeletePressed>(_deletePressed);
  }

  FutureOr<void> _textChanged(
    _TextChanged event,
    Emitter<TodoFormState> emit,
  ) {
    final todo = state.todo.copyWith(text: event.text);

    emit(state.copyWith(todo: todo, isChanged: true));
  }

  FutureOr<void> _importanceChanged(
    _ImportanceChanged event,
    Emitter<TodoFormState> emit,
  ) {
    final todo = state.todo.copyWith(importance: event.importance);

    emit(state.copyWith(todo: todo, isChanged: true));
  }

  FutureOr<void> _deadlineChanged(
    _DeadlineChanged event,
    Emitter<TodoFormState> emit,
  ) {
    // CopyWith doesn't change non null value to null,
    // so we need to create new instance by hand
    final previousTodo = state.todo;
    final todo = Todo(
      id: previousTodo.id,
      text: previousTodo.text,
      importance: previousTodo.importance,
      done: previousTodo.done,
      createdAt: previousTodo.changedAt,
      changedAt: previousTodo.createdAt,
      deadline: event.deadline,
    );

    emit(state.copyWith(todo: todo, isChanged: true));
  }

  FutureOr<void> _savePressed(
    _SavePressed event,
    Emitter<TodoFormState> emit,
  ) async {
    final todo = state.todo;

    if (todo.isFilled) {
      emit(state.copyWith(isLoading: true));

      try {
        if (state.isEditing) {
          await _updateTodo(todo, emit);
        } else {
          await _createTodo(todo, emit);
        }
      } on CachedException catch (e, stackTrace) {
        LoggerController.logger
            .warning('Some problem with todo localy storage', e, stackTrace);
      } finally {
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  FutureOr<void> _updateTodo(Todo todo, Emitter<TodoFormState> emit) async {
    final localRevision = await _localDataSource.getRevision();
    final deviceId = await _deviceIdProvider.getDeviceId();

    final todoData = TodoData.single(
      todo: todo.copyWith(
        changedAt: DateTime.now(),
        lastUpdatedBy: deviceId,
      ),
      revision: localRevision,
    );

    await _localDataSource.update(todoData as SingleTodoData);

    emit(state.copyWith(shouldPop: true, isLoading: false));

    try {
      final remoteData = await _remoteDataSource.update(todoData);

      _localDataSource.update(remoteData);
    } on NetworkException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with remote store', e, stackTrace);

      _localDataSource.setIsDurtyData(true);
    }
  }

  FutureOr<void> _createTodo(Todo todo, Emitter<TodoFormState> emit) async {
    final localRevision = await _localDataSource.getRevision();
    final deviceId = await _deviceIdProvider.getDeviceId();

    final date = DateTime.now();

    final todoData = TodoData.single(
      todo: todo.copyWith(
        createdAt: date,
        changedAt: date,
        lastUpdatedBy: deviceId,
      ),
      revision: localRevision,
    );

    await _localDataSource.add(todoData as SingleTodoData);

    emit(state.copyWith(shouldPop: true, isLoading: false));

    try {
      final remoteData = await _remoteDataSource.create(todoData);

      _localDataSource.update(remoteData);
    } on NetworkException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with remote store', e, stackTrace);

      _localDataSource.setIsDurtyData(true);
    }
  }

  FutureOr<void> _deletePressed(
    _DeletePressed event,
    Emitter<TodoFormState> emit,
  ) async {
    if (state.isEditing) {
      emit(state.copyWith(isLoading: true));

      try {
        final storedTodoData = await _localDataSource.get(state.todo.id);

        await _localDataSource.delete(storedTodoData);

        try {
          await _remoteDataSource.delete(storedTodoData);
        } on NetworkException catch (e, stackTrace) {
          LoggerController.logger
              .warning('Some problem with remote store', e, stackTrace);

          _localDataSource.setIsDurtyData(true);
        }

        emit(state.copyWith(shouldPop: true, isLoading: false));
      } on CachedException catch (e, stackTrace) {
        LoggerController.logger
            .warning('Some problem with todo localy storage', e, stackTrace);
        emit(state.copyWith(isLoading: false));
      }
    }
  }
}
