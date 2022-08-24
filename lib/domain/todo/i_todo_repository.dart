import 'models/todo.dart';

abstract class ITodoRepository {
  Stream<Todo?> watch();

  Future<Iterable<Todo>> getAll([bool cached = false]);

  Future<Todo> get(String todoId, [bool cached = false]);

  Future<void> add(Todo todo);

  Future<void> update(Todo todo);

  Future<void> delete(Todo todo);

  Future<void> synchronizeData();
}
