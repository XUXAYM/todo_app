part of 'add_todo_bloc.dart';

@freezed
class AddTodoEvent with _$AddTodoEvent {
  const factory AddTodoEvent.textChanged(String text) = _TextChanged;

  const factory AddTodoEvent.addTodoPressed() = _AddTodoPressed;
}
