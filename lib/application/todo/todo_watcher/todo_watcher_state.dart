part of 'todo_watcher_bloc.dart';

@freezed
class TodoWatcherState with _$TodoWatcherState {
  factory TodoWatcherState.initial() => TodoWatcherState(
        todos: [],
        hideCompleted: false,
        isLoading: true,
        initial: true,
      );

  factory TodoWatcherState({
    required Iterable<Todo> todos,
    required bool hideCompleted,
    @Default(false) bool isLoading,
    @Default(false) bool initial,
    Exception? exception,
  }) = _TodoWatcherState;
}
