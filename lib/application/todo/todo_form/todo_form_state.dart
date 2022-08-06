part of 'todo_form_bloc.dart';

@freezed
class TodoFormState with _$TodoFormState {
  factory TodoFormState.initial([Todo? todo]) => TodoFormState(
        todo: todo ?? Todo.empty(),
        isEditing: todo != null,
      );

  const factory TodoFormState({
    required Todo todo,
    required bool isEditing,
    @Default(false) bool isLoading,
    @Default(false) bool isChanged,
    @Default(false) bool shouldPop,
  }) = _TodoFormState;
}
