import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_importance.freezed.dart';
part 'todo_importance.g.dart';

@Freezed(unionKey: 'importance', unionValueCase: FreezedUnionCase.snake)
class TodoImportance with _$TodoImportance {
  @FreezedUnionValue('low')
  const factory TodoImportance.low() = _Low;

  @FreezedUnionValue('basic')
  const factory TodoImportance.normal() = _Normal;

  @FreezedUnionValue('important')
  const factory TodoImportance.high() = _High;

  factory TodoImportance.fromJson(Map<String, dynamic> json) =>
      _$TodoImportanceFromJson(json);
}
