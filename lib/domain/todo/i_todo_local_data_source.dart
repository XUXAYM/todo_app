import 'models/todo.dart';
import 'models/todo_data.dart';

abstract class ITodoLocalDataSource {
  Stream<Todo?> watch();

  Future<int> getRevision();

  Future<bool> isDurtyData();

  Future<void> setIsDurtyData(bool value);

  Future<CollectionTodoData> getAll();

  Future<void> replaceAll(
    CollectionTodoData todoData,
  );

  Future<SingleTodoData> get(String todoId);

  Future<void> add(SingleTodoData todoData);

  Future<void> update(SingleTodoData todoData);

  Future<void> delete(SingleTodoData todoData);
}
