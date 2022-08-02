import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/application/core/methods.dart';
import 'package:todo_app/domain/todo/exceptions/cached_exceptions.dart';

import '../../../domain/todo/i_todo_local_data_source.dart';
import '../../../domain/todo/i_todo_remote_data_source.dart';
import '../../../domain/todo/models/todo.dart';
import '../../../domain/todo/models/todo_data.dart';
import '../../../domain/todo/models/todo_importance.dart';
import '../../../presentation/services/logger_controller.dart';

part 'todo_form_bloc.freezed.dart';
part 'todo_form_event.dart';
part 'todo_form_state.dart';

const Duration _duration = Duration(milliseconds: 150);

@injectable
class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  final ITodoLocalDataSource _localDataSource;
  // TODO: Implement remote interactions
  final ITodoRemoteDataSource _remoteDataSource;

  TodoFormBloc(
    @factoryParam Todo? todo,
    ITodoLocalDataSource todoLocalDataSource,
    ITodoRemoteDataSource todoRemoteDataSource,
  )   : _localDataSource = todoLocalDataSource,
        _remoteDataSource = todoRemoteDataSource,
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

    emit(state.copyWith(todo: todo));
  }

  FutureOr<void> _importanceChanged(
    _ImportanceChanged event,
    Emitter<TodoFormState> emit,
  ) {
    final todo = state.todo.copyWith(importance: event.importance);

    emit(state.copyWith(todo: todo));
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

    emit(state.copyWith(todo: todo));
  }

  FutureOr<void> _savePressed(
    _SavePressed event,
    Emitter<TodoFormState> emit,
  ) async {
    final todo = state.todo;

    if (todo.isFilled) {
      final localRevision = await _localDataSource.getRevision();

      final todoData = TodoData.single(
        todo: todo,
        revision: localRevision,
      );

      try {
        if (state.isEditing) {
          await _localDataSource.update(todoData as SingleTodoData);
        } else {}
      } on CachedException catch (e, stackTrace) {
        LoggerController.logger
            .warning('Some problem with todo localy storage', e, stackTrace);
      }
    }
  }

  FutureOr<void> _deletePressed(
    _DeletePressed event,
    Emitter<TodoFormState> emit,
  ) async {
    if (state.isEditing) {
      try {
        final storedTodoData = await _localDataSource.get(state.todo.id);

        await _localDataSource.delete(storedTodoData);
      } on CachedException catch (e, stackTrace) {
        LoggerController.logger
            .warning('Some problem with todo localy storage', e, stackTrace);
      }
    }
  }
}
