// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'todo.dart';

part 'todo_data.freezed.dart';
part 'todo_data.g.dart';

@freezed
class TodoData with _$TodoData {
  const factory TodoData.collection({
    @JsonKey(name: 'list') required Iterable<Todo> todos,
    required int revision,
  }) = CollectionTodoData;

  const factory TodoData.single({
    @JsonKey(name: 'element') required Todo todo,
    required int revision,
  }) = SingleTodoData;

  factory TodoData.fromJson(Map<String, dynamic> json) =>
      _$TodoDataFromJson(json);
}
