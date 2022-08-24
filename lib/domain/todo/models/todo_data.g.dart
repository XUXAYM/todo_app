// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectionTodoData _$$CollectionTodoDataFromJson(Map<String, dynamic> json) =>
    _$CollectionTodoData(
      todos: (json['list'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>)),
      revision: json['revision'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CollectionTodoDataToJson(
        _$CollectionTodoData instance) =>
    <String, dynamic>{
      'list': instance.todos.toList(),
      'revision': instance.revision,
      'runtimeType': instance.$type,
    };

_$SingleTodoData _$$SingleTodoDataFromJson(Map<String, dynamic> json) =>
    _$SingleTodoData(
      todo: Todo.fromJson(json['element'] as Map<String, dynamic>),
      revision: json['revision'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SingleTodoDataToJson(_$SingleTodoData instance) =>
    <String, dynamic>{
      'element': instance.todo,
      'revision': instance.revision,
      'runtimeType': instance.$type,
    };
