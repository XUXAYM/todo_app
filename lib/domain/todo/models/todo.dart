import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/domain/todo/models/todo_importance.dart';

import '../../core/services/id_factory.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String text,
    required TodoImportance importance,
    required bool done,
    DateTime? deadline,
    DateTime? createdAt,
    DateTime? changedAt,
  }) = _Todo;

  factory Todo.empty() => Todo(
        id: IdFactory.generateId(),
        text: '',
        importance: const TodoImportance.normal(),
        done: false,
      );
}
