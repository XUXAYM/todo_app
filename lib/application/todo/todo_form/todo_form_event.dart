part of 'todo_form_bloc.dart';

@freezed
class TodoFormEvent with _$TodoFormEvent {
  const factory TodoFormEvent.textChanged(String text) = _TextChanged;

  const factory TodoFormEvent.importanceChanged(TodoImportance importance) =
      _ImportanceChanged;

  const factory TodoFormEvent.deadlineChanged(DateTime? deadline) =
      _DeadlineChanged;

  const factory TodoFormEvent.savePressed() = _SavePressed;

  const factory TodoFormEvent.deletePressed() = _DeletePressed;
}
