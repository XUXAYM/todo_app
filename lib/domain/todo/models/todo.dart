// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/json_converters/timestamp_or_null_converter.dart';
import '../../core/services/id_factory.dart';
import 'todo_importance.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@Freezed(unionKey: 'element', unionValueCase: FreezedUnionCase.snake)
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String text,
    required TodoImportance importance,
    required bool done,
    @TimestampOrNullConverter() DateTime? deadline,
    @JsonKey(name: 'created_at')
    @TimestampOrNullConverter()
        DateTime? createdAt,
    @JsonKey(name: 'changed_at')
    @TimestampOrNullConverter()
        DateTime? changedAt,
  }) = _Todo;

  factory Todo.empty() => Todo(
        id: IdFactory.generate(),
        text: '',
        importance: const TodoImportance.normal(),
        done: false,
      );

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
