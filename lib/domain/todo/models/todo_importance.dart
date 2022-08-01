// part 'todo_importance.freezed.dart';
// part 'todo_importance.g.dart';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_importance.g.dart';

@HiveType(typeId: 1)
enum TodoImportance {
  @HiveField(0)
  @JsonValue('low')
  low,
  @HiveField(1)
  @JsonValue('basic')
  basic,
  @HiveField(2)
  @JsonValue('important')
  important,
}

// @Freezed(unionKey: 'importance', unionValueCase: FreezedUnionCase.snake)
// class TodoImportance with _$TodoImportance {
//   @FreezedUnionValue('low')
//   const factory TodoImportance.low() = _Low;

//   @HiveType(typeId: 2)
//   @FreezedUnionValue('basic')
//   const factory TodoImportance.normal() = _Normal;

//   @HiveType(typeId: 3)
//   @FreezedUnionValue('important')
//   const factory TodoImportance.high() = _High;

//   factory TodoImportance.fromJson(Map<String, dynamic> json) =>
//       _$TodoImportanceFromJson(json);
// }
