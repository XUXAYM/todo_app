import 'package:injectable/injectable.dart';

import '../../domain/todo/exceptions/cached_exceptions.dart';
import '../../domain/todo/i_todo_local_data_source.dart';
import '../../domain/todo/models/todo_data.dart';
import '../core/services/hive_box_controller.dart';

@LazySingleton(as: ITodoLocalDataSource)
class HiveTodoLocalDataSource implements ITodoLocalDataSource {
  static const String _revisionKey = 'revision';

  @override
  Future<CollectionTodoData> getAll() async {
    final todoBox = await HiveBoxController.getTodoBox();
    final settingsBox = await HiveBoxController.getSettingsBox();

    try {
      final revision = settingsBox.get(_revisionKey) as int?;

      if (revision != null) {
        return CollectionTodoData(todos: todoBox.values, revision: revision);
      } else {
        return const CollectionTodoData(todos: [], revision: -1);
      }
    } finally {
      await todoBox.close();
    }
  }

  @override
  Future<SingleTodoData> get(String todoId) async {
    final todoBox = await HiveBoxController.getTodoBox();
    final settingsBox = await HiveBoxController.getSettingsBox();

    try {
      final revision = settingsBox.get(_revisionKey) as int?;

      if (revision != null) {
        final todo = todoBox.get(todoId);

        if (todo == null) throw const NotFoundedException();

        return SingleTodoData(todo: todo, revision: revision);
      } else {
        throw const NoDataException();
      }
    } finally {
      await todoBox.close();
    }
  }

  @override
  Future<void> add(SingleTodoData todoData) async {
    final todoBox = await HiveBoxController.getTodoBox();
    final settingsBox = await HiveBoxController.getSettingsBox();

    try {
      final todo = todoData.todo;

      await todoBox.put(todo.id, todo);
      await settingsBox.put(_revisionKey, todoData.revision);
    } finally {
      await todoBox.close();
    }
  }

  @override
  Future<void> update(SingleTodoData todoData) => add(todoData);

  @override
  Future<void> delete(SingleTodoData todoData) async {
    final todoBox = await HiveBoxController.getTodoBox();
    final settingsBox = await HiveBoxController.getSettingsBox();

    try {
      await todoBox.delete(todoData.todo);
      await settingsBox.put(_revisionKey, todoData.revision);
    } finally {
      await todoBox.close();
    }
  }
}
