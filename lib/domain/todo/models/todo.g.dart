// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      id: json['id'] as String,
      text: json['text'] as String,
      importance:
          TodoImportance.fromJson(json['importance'] as Map<String, dynamic>),
      done: json['done'] as bool,
      deadline:
          const TimestampOrNullConverter().fromJson(json['deadline'] as int?),
      createdAt:
          const TimestampOrNullConverter().fromJson(json['created_at'] as int?),
      changedAt:
          const TimestampOrNullConverter().fromJson(json['changed_at'] as int?),
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'importance': instance.importance,
      'done': instance.done,
      'deadline': const TimestampOrNullConverter().toJson(instance.deadline),
      'created_at': const TimestampOrNullConverter().toJson(instance.createdAt),
      'changed_at': const TimestampOrNullConverter().toJson(instance.changedAt),
    };
