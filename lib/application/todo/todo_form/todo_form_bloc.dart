import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/todo/exceptions/repository_exceptions.dart';
import '../../../domain/todo/i_todo_repository.dart';
import '../../../domain/todo/models/todo.dart';
import '../../../presentation/services/logger_controller.dart';
import '../../core/methods.dart';

part 'todo_form_bloc.freezed.dart';
part 'todo_form_event.dart';
part 'todo_form_state.dart';

const Duration _duration = Duration(milliseconds: 150);

@injectable
class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  final ITodoRepository _todoRepository;

  TodoFormBloc(
    @factoryParam Todo? todo,
    ITodoRepository todoRepository,
  )   : _todoRepository = todoRepository,
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
          await _todoRepository.update(todo);
        } else {
          await _todoRepository.add(todo);
        }

        emit(state.copyWith(shouldPop: true, isLoading: false));
      } on RepositoryException catch (e, stackTrace) {
        LoggerController.logger
            .warning('Some problem with todo repository', e, stackTrace);
        emit(state.copyWith(isLoading: false));
      } on Object catch (e, stackTrace) {
        LoggerController.logger.warning('Unexpected exception', e, stackTrace);
        emit(state.copyWith(isLoading: false));
        rethrow;
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
        await _todoRepository.delete(state.todo);

        emit(state.copyWith(shouldPop: true, isLoading: false));
      } on RepositoryException catch (e, stackTrace) {
        LoggerController.logger
            .warning('Some problem with todo repository', e, stackTrace);
        emit(state.copyWith(isLoading: false));
      } on Object catch (e, stackTrace) {
        LoggerController.logger.warning('Unexpected exception', e, stackTrace);
        emit(state.copyWith(isLoading: false));
        rethrow;
      }
    }
  }
}
