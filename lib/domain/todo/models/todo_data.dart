// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'todo.dart';

part 'todo_data.freezed.dart';
part 'todo_data.g.dart';

@freezed
class TodoData with _$TodoData {
  const factory TodoData.collection({
    @JsonSerializable(explicitToJson: true)
    @JsonKey(name: 'list')
        required Iterable<Todo> todos,
    required int revision,
  }) = CollectionTodoData;

  const factory TodoData.single({
    @JsonKey(name: 'element') required Todo todo,
    required int revision,
  }) = SingleTodoData;

  factory TodoData.fromJson(Map<String, dynamic> json) =>
      const TodoDataConverter().fromJson(json);
}

class TodoDataConverter
    implements JsonConverter<TodoData, Map<String, dynamic>> {
  const TodoDataConverter();

  @override
  TodoData fromJson(Map<String, dynamic> json) {
    if (json['runtimeType'] != null) return TodoData.fromJson(json);

    if (json.containsKey('list')) {
      return CollectionTodoData.fromJson(json);
    } else if (json.containsKey('element')) {
      return SingleTodoData.fromJson(json);
    } else {
      throw Exception(
          'Could not determine the constructor for mapping from JSON');
    }
  }

  @override
  Map<String, dynamic> toJson(TodoData data) => data.toJson();
}
