// ignore_for_file: invalid_annotation_target, unused_element

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../core/json_converters/timestamp_converter.dart';
import '../../core/json_converters/timestamp_or_null_converter.dart';
import '../../core/services/id_factory.dart';
import 'todo_importance.dart';

export 'todo_importance.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
@Freezed(unionKey: 'element', unionValueCase: FreezedUnionCase.snake)
class Todo with _$Todo {
  const factory Todo({
    @HiveField(0) required String id,
    @HiveField(1) required String text,
    @HiveField(2) required TodoImportance importance,
    @HiveField(3) required bool done,
    @HiveField(4)
    @JsonKey(name: 'created_at')
    @TimestampConverter()
        required DateTime createdAt,
    @HiveField(5)
    @JsonKey(name: 'changed_at')
    @TimestampConverter()
        required DateTime changedAt,
    @HiveField(6) @TimestampOrNullConverter() DateTime? deadline,
    @HiveField(7) @JsonKey(name: 'last_updated_by') String? lastUpdatedBy,
  }) = _Todo;

  factory Todo.textOnly(String text) {
    final date = DateTime.now();

    return Todo(
      id: IdFactory.generate(),
      text: text,
      importance: TodoImportance.basic,
      done: false,
      createdAt: date,
      changedAt: date,
    );
  }

  factory Todo.empty() {
    final date = DateTime.now();
    return Todo(
      id: IdFactory.generate(),
      text: '',
      importance: TodoImportance.basic,
      done: false,
      createdAt: date,
      changedAt: date,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  const Todo._();

  bool get isFilled => text.trim().isNotEmpty;
}
