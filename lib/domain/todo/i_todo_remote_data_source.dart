import 'models/todo_data.dart';

abstract class ITodoRemoteDataSource {
  Future<CollectionTodoData> getAll();

  Future<CollectionTodoData> replaceAll(
    CollectionTodoData todoData,
  );

  Future<SingleTodoData> create(SingleTodoData todoData);

  Future<SingleTodoData> get(String todoId);

  Future<SingleTodoData> update(SingleTodoData todoData);

  Future<SingleTodoData> delete(String todoId);
}
