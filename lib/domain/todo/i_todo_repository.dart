import 'models/todo.dart';

abstract class ITodoRepository {
  Stream<Todo?> watch();

  Future<Iterable<Todo>> getAll();

  Future<Todo> get(String todoId);

  Future<void> add(Todo todo);

  Future<void> update(Todo todo);

  Future<void> delete(Todo todo);

  Future<void> synchronizeData();
}
