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
      createdAt: fields[5] as DateTime,
      changedAt: fields[6] as DateTime,
      deadline: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.importance)
      ..writeByte(3)
      ..write(obj.done)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.changedAt)
      ..writeByte(4)
      ..write(obj.deadline);
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
      createdAt: DateTime.parse(json['created_at'] as String),
      changedAt: const TimestampConverter().fromJson(json['changed_at'] as int),
      deadline: _$JsonConverterFromJson<int, DateTime>(
          json['deadline'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'importance': _$TodoImportanceEnumMap[instance.importance]!,
      'done': instance.done,
      'created_at': instance.createdAt.toIso8601String(),
      'changed_at': const TimestampConverter().toJson(instance.changedAt),
      'deadline': _$JsonConverterToJson<int, DateTime>(
          instance.deadline, const TimestampConverter().toJson),
    };

const _$TodoImportanceEnumMap = {
  TodoImportance.low: 'low',
  TodoImportance.basic: 'basic',
  TodoImportance.important: 'important',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
