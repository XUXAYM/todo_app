import 'package:injectable/injectable.dart';

import '../../domain/todo/exceptions/cached_exceptions.dart';
import '../../domain/todo/i_todo_local_data_source.dart';
import '../../domain/todo/models/todo.dart';
import '../../domain/todo/models/todo_data.dart';
import '../core/services/hive_box_controller.dart';

@LazySingleton(as: ITodoLocalDataSource)
class HiveTodoLocalDataSource implements ITodoLocalDataSource {
  static const String _revisionKey = 'revision';
  static const String _isDirtyDataKey = 'isDirty';

  @override
  Stream<Todo?> watch() async* {
    final todoBox = await HiveBoxController.getTodoBox();

    yield* todoBox.watch().map((event) => event.value as Todo?);
  }

  @override
  Future<int> getRevision() async {
    final settingsBox = await HiveBoxController.getSettingsBox();
    final revision = settingsBox.get(_revisionKey) as int?;

    return revision ?? -1;
  }

  @override
  Future<bool> isDurtyData() async {
    final settingsBox = await HiveBoxController.getSettingsBox();
    final isDirty = settingsBox.get(_isDirtyDataKey) as bool?;

    return isDirty ?? false;
  }

  @override
  Future<void> setIsDurtyData(bool value) async {
    final settingsBox = await HiveBoxController.getSettingsBox();
    await settingsBox.put(_isDirtyDataKey, value);
  }

  @override
  Future<CollectionTodoData> getAll() async {
    final todoBox = await HiveBoxController.getTodoBox();
    final revision = await getRevision();

    return CollectionTodoData(todos: todoBox.values, revision: revision);
  }

  @override
  Future<void> replaceAll(CollectionTodoData todoData) async {
    final todoBox = await HiveBoxController.getTodoBox();
    final settingsBox = await HiveBoxController.getSettingsBox();

    await todoBox.clear();

    await todoBox.addAll(todoData.todos);
    await settingsBox.put(_revisionKey, todoData.revision);
  }

  @override
  Future<SingleTodoData> get(String todoId) async {
    final todoBox = await HiveBoxController.getTodoBox();

    final revision = await getRevision();

    final todo = todoBox.get(todoId);

    if (todo == null) throw const NotFoundedException();

    return SingleTodoData(todo: todo, revision: revision);
  }

  @override
  Future<void> add(SingleTodoData todoData) async {
    final todoBox = await HiveBoxController.getTodoBox();
    final settingsBox = await HiveBoxController.getSettingsBox();

    final todo = todoData.todo;

    await todoBox.put(todo.id, todo);
    await settingsBox.put(_revisionKey, todoData.revision);
  }

  @override
  Future<void> update(SingleTodoData todoData) => add(todoData);

  @override
  Future<void> delete(SingleTodoData todoData) async {
    final todoBox = await HiveBoxController.getTodoBox();
    final settingsBox = await HiveBoxController.getSettingsBox();

    await todoBox.delete(todoData.todo.id);
    await settingsBox.put(_revisionKey, todoData.revision);
  }
}
