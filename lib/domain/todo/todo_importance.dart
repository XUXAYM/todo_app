import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_importance.freezed.dart';

@freezed
class TodoImportance with _$TodoImportance {
  const factory TodoImportance.low() = _Low;

  const factory TodoImportance.normal() = _Normal;

  const factory TodoImportance.high() = _High;
}
