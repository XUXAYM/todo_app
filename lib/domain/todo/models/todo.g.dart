// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final int typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      id: fields[0] as String,
      text: fields[1] as String,
      importance: fields[2] as TodoImportance,
      done: fields[3] as bool,
      createdAt: fields[4] as DateTime,
      changedAt: fields[5] as DateTime,
      deadline: fields[6] as DateTime?,
      lastUpdatedBy: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.importance)
      ..writeByte(3)
      ..write(obj.done)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.changedAt)
      ..writeByte(6)
      ..write(obj.deadline)
      ..writeByte(7)
      ..write(obj.lastUpdatedBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      id: json['id'] as String,
      text: json['text'] as String,
      importance: $enumDecode(_$TodoImportanceEnumMap, json['importance']),
      done: json['done'] as bool,
      createdAt: const TimestampConverter().fromJson(json['created_at'] as int),
      changedAt: const TimestampConverter().fromJson(json['changed_at'] as int),
      deadline:
          const TimestampOrNullConverter().fromJson(json['deadline'] as int?),
      lastUpdatedBy: json['last_updated_by'] as String?,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'importance': _$TodoImportanceEnumMap[instance.importance]!,
      'done': instance.done,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'changed_at': const TimestampConverter().toJson(instance.changedAt),
      'deadline': const TimestampOrNullConverter().toJson(instance.deadline),
      'last_updated_by': instance.lastUpdatedBy,
    };

const _$TodoImportanceEnumMap = {
  TodoImportance.low: 'low',
  TodoImportance.basic: 'basic',
  TodoImportance.important: 'important',
};
