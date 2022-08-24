part of 'todo_watcher_bloc.dart';

@freezed
class TodoWatcherEvent with _$TodoWatcherEvent {
  const factory TodoWatcherEvent.todosFetched() = _TodosFetched;

  const factory TodoWatcherEvent.todosRequested() = _TodosRequested;

  const factory TodoWatcherEvent.completedVisibilityChanged() =
      _CompletedVisibilityChanged;

  const factory TodoWatcherEvent.todoDeleted(Todo todo) = _TodoDeleted;

  const factory TodoWatcherEvent.todoToggled(Todo todo) = _TodoToggled;
}
