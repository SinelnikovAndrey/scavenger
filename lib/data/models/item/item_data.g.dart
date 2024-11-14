// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemDataAdapter extends TypeAdapter<ItemData> {
  @override
  final int typeId = 0;

  @override
  ItemData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemData(
      id: fields[0] as String?,
      name: fields[1] as String,
      color: fields[2] as String,
      form: fields[3] as String,
      group: fields[4] as String?,
      description: fields[5] as String?,
      photoUrl: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.form)
      ..writeByte(4)
      ..write(obj.group)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.photoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
