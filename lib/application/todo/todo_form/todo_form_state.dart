part of 'todo_form_bloc.dart';

@freezed
class TodoFormState with _$TodoFormState {
  factory TodoFormState.initial() => TodoFormState(todo: Todo.empty());

  const factory TodoFormState({
    required Todo todo,
    @Default(false) bool isEditing,
    @Default(false) bool isLoading,
    @Default(false) bool isChanged,
    @Default(false) bool shouldPop,
  }) = _TodoFormState;
}
