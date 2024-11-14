
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';

// part 'history_data.g.dart';

// @HiveType(typeId: 1)
// class HistoryData extends HiveObject {
//   @HiveField(0)
//   int id;

//   @HiveField(1)
//   String placeName;

//   @HiveField(2)
//   int saveDateMillis;

//   @HiveField(3)
//   String saveTimeString;

//   @HiveField(4)
//   String? placeDescription;

//   @HiveField(5)
//   String? photoUrl;

//   @HiveField(6)
//   String itemName;

//   @HiveField(7)
//   String? itemColor;

//   @HiveField(8)
//   String? itemForm;

//   @HiveField(9)
//   String? itemGroup;

//   @HiveField(10)
//   String? itemDescription;

//   @HiveField(11)
//   String? placePhotoUrl;

//   HistoryData({
//     required this.id,
//     required this.placeName,
//     required DateTime saveDateTime,
//     required this.itemName,
//     this.placeDescription,
//     this.photoUrl,
//     this.itemColor,
//     this.itemForm,
//     this.itemGroup,
//     this.itemDescription,
//     this.placePhotoUrl,
//   }) :
//     saveDateMillis = saveDateTime.millisecondsSinceEpoch,
//     saveTimeString = DateFormat('HH:mm').format(saveDateTime);

//   // Getter to access the DateTime value
//   DateTime get saveDateTime => DateTime.fromMillisecondsSinceEpoch(saveDateMillis);

//   TimeOfDay get saveTime => TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(saveTimeString));

//   DateTime get saveDate => DateTime.fromMillisecondsSinceEpoch(saveDateMillis).toLocal();
// }


// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';    
    

//     part 'history_data.g.dart';
    
// class HistoryData {
//   int id;
//   String placeName;
//   DateTime saveDate; // Store as Date
//   TimeOfDay saveTime; // Store as Time
//   String? placeDescription;
//   String? photoUrl;
//   String itemName;
//   String? itemColor;
//   String? itemForm;
//   String? itemGroup;
//   String? itemDescription;
//   String? placePhotoUrl;

//   HistoryData({
//     required this.id,
//     required this.placeName,
//     required DateTime saveDateTime, // Constructor still takes DateTime
//     required this.itemName,
//     this.placeDescription,
//     this.photoUrl,
//     this.itemColor,
//     this.itemForm,
//     this.itemGroup,
//     this.itemDescription,
//     this.placePhotoUrl, required DateTime saveDate, required saveTime,
//   }) : 
//     saveDate = DateTime(saveDateTime.year, saveDateTime.month, saveDateTime.day),
//     saveTime = TimeOfDay(hour: saveDateTime.hour, minute: saveDateTime.minute);

//   // Combined getter for the DateTime value
//   DateTime get saveDateTime => DateTime(saveDate.year, saveDate.month, saveDate.day, saveTime.hour, saveTime.minute); 
// }


    class HistoryData {
  int id; 
  String placeName;
  DateTime saveDateTime; 
  String fetchDate;
  String fetchTime;
  String? placeDescription;
  String? photoUrl;
  String itemName;
  String? itemColor;
  String? itemForm;
  String? itemGroup;
  String? itemDescription;
  String? placePhotoUrl;

  

  HistoryData( {
    required this.id,
    required this.placeName,
    required this.saveDateTime,
    required this.itemName,
    this.placeDescription,
    this.photoUrl,
    required this.fetchDate,
    required this.fetchTime,
    this.itemColor,
    this.itemForm,
    this.itemGroup,
    this.itemDescription,
    this.placePhotoUrl,
  });
}
//     @HiveType(typeId: 1)
// class HistoryData extends HiveObject {
//   @HiveField(0)
//   int id; 

//   @HiveField(1)
//   final String placeName;

//   @HiveField(2)
//   DateTime saveDateTimeMillis; 

//   @HiveField(3)
//   String? placeDescription;

//   @HiveField(4)
//   String? photoUrl;

//   @HiveField(5)
//   String itemName;

//   @HiveField(6)
//   String? itemColor;

//   @HiveField(7)
//   String? itemForm;

//   @HiveField(8)
//   String? itemGroup;

//   @HiveField(9)
//   String? itemDescription;

//   @HiveField(10)
//   String? placePhotoUrl;



// HistoryData ({
//     required this.id,
//     required this.placeName,
//     required this.saveDateTimeMillis,
//     required this.itemName,
//     this.placeDescription,
//     this.photoUrl,
//     this.itemColor,
//     this.itemForm,
//     this.itemGroup,
//     this.itemDescription,
//     this.placePhotoUrl,
//   });



// }
// //   PlaceData({
// //     required this.id,
// //     required this.placeName,
// //     required this.saveDateTime,
// //     this.photoUrl,
// //     this.placeDescription,
// //     required this.itemName, 
// //     this.itemColor, 
// //     this.itemForm, 
// //     this.itemGroup, 
// //     this.itemDescription, 
// //     this.placePhotoUrl,
// //   });
