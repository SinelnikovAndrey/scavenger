import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:hive/hive.dart';

void registerAdapters() {

  Hive.registerAdapter(ItemDataAdapter()); 
  Hive.registerAdapter(HistoryDataAdapter()); 
}

class ItemDataAdapter extends TypeAdapter<ItemData> {
  @override
  final int typeId = 0; // This is the same typeId as in @HiveType

  @override
  ItemData read(BinaryReader reader) {
    return ItemData(
      id: reader.readString(),
      name: reader.readString(),
      color: reader.readString(),
      form: reader.readString(),
      group: reader.readString(),
      description: reader.readString(),
      photoUrl: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, ItemData obj) {
    writer.writeString(obj.id ?? '');
    writer.writeString(obj.name);
    writer.writeString(obj.color); // Write an empty string if null
    writer.writeString(obj.form); 
    writer.writeString(obj.group ?? '');
    writer.writeString(obj.description ?? '');
    writer.writeString(obj.photoUrl ?? '');
  }
}


class HistoryDataAdapter extends TypeAdapter<HistoryData> {
  @override
  final int typeId = 1; 
  
   @override
  void write(BinaryWriter writer, HistoryData obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.placeName);
    writer.write(obj.saveDateTime);
    writer.writeString(obj.photoUrl ?? ''); // Write photoUrl (null to empty string)
    writer.writeString(obj.placePhotoUrl ?? ''); // Write photoUrl (null to empty string)
    writer.writeString(obj.itemName);
    writer.writeString(obj.fetchDate); // Write photoUrl (null to empty string)
    writer.writeString(obj.fetchTime);
    
  }

  @override
  HistoryData read(BinaryReader reader) {
    final id = reader.readInt();
    final placeName = reader.readString();
    final saveDateTime = reader.read() ; 
    final photoUrl = reader.readString();
    final itemName = reader.readString();
    final placePhotoUrl = reader.readString();
    final fetchDate = reader.readString();
    final fetchTime = reader.readString();

    return HistoryData(
      id: id,
      placeName: placeName,
      saveDateTime: saveDateTime,
      photoUrl: photoUrl, 
      itemName: itemName, 
      placePhotoUrl: placePhotoUrl, 
      fetchDate: fetchDate, 
      fetchTime: fetchTime, 
    );
  } 

 
}



// class HistoryDataAdapter extends TypeAdapter<HistoryData> {
//   @override
//   final int typeId = 1;

//   @override
//   HistoryData read(BinaryReader reader) {
//     try {
//       final id = reader.readInt();
//       final placeName = reader.readString();
//       final saveDateMillis = reader.readInt();
//       final saveTimeString = reader.readString();
//       final placeDescription = reader.readStringOrNull();
//       final photoUrl = reader.readStringOrNull();
//       final itemName = reader.readString();
//       final itemColor = reader.readStringOrNull();
//       final itemForm = reader.readStringOrNull();
//       final itemGroup = reader.readStringOrNull();
//       final itemDescription = reader.readStringOrNull();
//       final placePhotoUrl = reader.readStringOrNull();

//       // Convert saveTimeString back to TimeOfDay
//       final saveTime = TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(saveTimeString));

//       return HistoryData(
//         id: id,
//         placeName: placeName,
//         saveDate: DateTime.fromMillisecondsSinceEpoch(saveDateMillis),
//         saveTime: saveTime,
//         itemName: itemName,
//         placeDescription: placeDescription,
//         photoUrl: photoUrl,
//         itemColor: itemColor,
//         itemForm: itemForm,
//         itemGroup: itemGroup,
//         itemDescription: itemDescription,
//         placePhotoUrl: placePhotoUrl,
//       );
//     } on RangeError catch (e) {
//       print('RangeError in HistoryDataAdapter.read(): $e');
//       return _createDefaultHistoryData('RangeError');
//     } on HiveError catch (e) {
//       print('HiveError in HistoryDataAdapter.read(): $e');
//       return _createDefaultHistoryData('HiveError');
//     } catch (e) {
//       print('Unexpected error in HistoryDataAdapter.read(): $e');
//       return _createDefaultHistoryData('UnexpectedError');
//     }
//   }

//   @override
//   void write(BinaryWriter writer, HistoryData obj) {
//     writer.writeInt(obj.id);
//     writer.writeString(obj.placeName);
//     writer.writeInt(obj.saveDate.millisecondsSinceEpoch); 
//     writer.writeString(DateFormat('HH:mm').format(obj.saveTime)); 
//     writer.writeString(obj.placeDescription ?? '');
//     writer.writeString(obj.photoUrl ?? '');
//     writer.writeString(obj.itemName);
//     writer.writeString(obj.itemColor ?? '');
//     writer.writeString(obj.itemForm ?? '');
//     writer.writeString(obj.itemGroup ?? '');
//     writer.writeString(obj.itemDescription ?? '');
//     writer.writeString(obj.placePhotoUrl ?? '');
//   }

//   HistoryData _createDefaultHistoryData(String errorMessage) {
//     return HistoryData(
//       id: -1,
//       placeName: 'Error',
//       saveDateTime: DateTime.now(),
//       itemName: 'Error',
//       placeDescription: errorMessage,
//     );
//   }
// }
