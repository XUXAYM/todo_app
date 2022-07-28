import 'models/todo.dart';

abstract class ITodoRepository {
  Future<Iterable<Todo>> getAll();

  Future<Iterable<Todo>> replaceAll(Iterable<Todo> todos);

  Future<Todo> create(Todo todo);

  Future<Todo> get(String id);

  Future<Todo> update(Todo todo);

  Future<void> delete(String id);
}
