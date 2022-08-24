// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_importance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoImportanceAdapter extends TypeAdapter<TodoImportance> {
  @override
  final int typeId = 1;

  @override
  TodoImportance read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TodoImportance.low;
      case 1:
        return TodoImportance.basic;
      case 2:
        return TodoImportance.important;
      default:
        return TodoImportance.low;
    }
  }

  @override
  void write(BinaryWriter writer, TodoImportance obj) {
    switch (obj) {
      case TodoImportance.low:
        writer.writeByte(0);
        break;
      case TodoImportance.basic:
        writer.writeByte(1);
        break;
      case TodoImportance.important:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoImportanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
