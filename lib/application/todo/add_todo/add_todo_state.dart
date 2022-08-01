part of 'add_todo_bloc.dart';

@freezed
class AddTodoState with _$AddTodoState {
  factory AddTodoState.empty() => const AddTodoState(
        text: '',
        isLoading: false,
        canCreate: false,
      );

  const factory AddTodoState({
    required String text,
    required bool isLoading,
    required bool canCreate,
    Exception? exception,
  }) = _AddTodoTileState;
}
