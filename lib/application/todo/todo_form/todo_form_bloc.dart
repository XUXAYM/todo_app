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
import '../../core/methods.dart';

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
    emit(state.copyWith(isLoading: true));

    final todo = state.todo;

    if (todo.isFilled) {
      final localRevision = await _localDataSource.getRevision();

      try {
        if (state.isEditing) {
          final todoData = TodoData.single(
            todo: todo.copyWith(changedAt: DateTime.now()),
            revision: localRevision,
          );
          await _localDataSource.update(todoData as SingleTodoData);
        } else {
          final date = DateTime.now();

          final todoData = TodoData.single(
            todo: todo.copyWith(
              createdAt: date,
              changedAt: date,
            ),
            revision: localRevision,
          );

          await _localDataSource.add(todoData as SingleTodoData);
        }

        emit(state.copyWith(shouldPop: true, isLoading: false));
      } on CachedException catch (e, stackTrace) {
        LoggerController.logger
            .warning('Some problem with todo localy storage', e, stackTrace);

        emit(state.copyWith(isLoading: false));
      }
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

        emit(state.copyWith(shouldPop: true, isLoading: false));
      } on CachedException catch (e, stackTrace) {
        LoggerController.logger
            .warning('Some problem with todo localy storage', e, stackTrace);
        emit(state.copyWith(isLoading: false));
      }
    }
  }
}
