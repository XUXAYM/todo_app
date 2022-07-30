import 'models/todo_data.dart';

abstract class ITodoLocalDataSource {
  Future<CollectionTodoData> getAll();

  Future<SingleTodoData> get(String todoId);

  Future<void> add(SingleTodoData todoData);

  Future<void> update(SingleTodoData todoData);

  Future<void> delete(SingleTodoData todoData);
}
