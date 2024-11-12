// import 'package:daily_scavenger/data/models/user/user_data.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class UserDataAdapter extends TypeAdapter<UserData> {
//   @override
//   final int typeId = 1; // Ensure this matches the typeId in the `read` method

//   @override
//   UserData read(BinaryReader reader) {
//     final displayName = reader.readString();
//     final email = reader.readString();
//     final phoneNumber = reader.readString();
//     final photoUrl = reader.readString();

//     return UserData(
//       displayName: displayName,
//       email: email,
//       phoneNumber: phoneNumber,
//       photoUrl: photoUrl != '' ? photoUrl : null, 
//     );
//   }

//   @override
//   void write(BinaryWriter writer, UserData obj) {
//     writer.writeString(obj.displayName);
//     writer.writeString(obj.email);
//     writer.writeString(obj.phoneNumber);
//     writer.writeString(obj.photoUrl ?? ''); 
//   }
// }