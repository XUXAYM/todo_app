import 'models/todo_data.dart';

abstract class ITodoLocalDataSource {
  Future<CollectionTodoData> getAll();

  Future<CollectionTodoData> replaceAll(
    CollectionTodoData todos,
  );

  Future<SingleTodoData> create(SingleTodoData todo);

  Future<SingleTodoData> get(String id);

  Future<SingleTodoData> update(SingleTodoData todo);

  Future<SingleTodoData> delete(String id);
}
