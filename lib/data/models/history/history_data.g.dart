// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'history_data.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class HistoryDataAdapter extends TypeAdapter<HistoryData> {
//   @override
//   final int typeId = 1;

//   @override
//   HistoryData read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return HistoryData(
//       id: fields[0] as int,
//       placeName: fields[1] as String,
//       itemName: fields[6] as String,
//       placeDescription: fields[4] as String?,
//       photoUrl: fields[5] as String?,
//       itemColor: fields[7] as String?,
//       itemForm: fields[8] as String?,
//       itemGroup: fields[9] as String?,
//       itemDescription: fields[10] as String?,
//       placePhotoUrl: fields[11] as String?,
//     )
//       ..saveDateMillis = fields[2] as int
//       ..saveTimeString = fields[3] as String;
//   }

//   @override
//   void write(BinaryWriter writer, HistoryData obj) {
//     writer
//       ..writeByte(12)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.placeName)
//       ..writeByte(2)
//       ..write(obj.saveDateMillis)
//       ..writeByte(3)
//       ..write(obj.saveTimeString)
//       ..writeByte(4)
//       ..write(obj.placeDescription)
//       ..writeByte(5)
//       ..write(obj.photoUrl)
//       ..writeByte(6)
//       ..write(obj.itemName)
//       ..writeByte(7)
//       ..write(obj.itemColor)
//       ..writeByte(8)
//       ..write(obj.itemForm)
//       ..writeByte(9)
//       ..write(obj.itemGroup)
//       ..writeByte(10)
//       ..write(obj.itemDescription)
//       ..writeByte(11)
//       ..write(obj.placePhotoUrl);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is HistoryDataAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
