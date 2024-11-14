// import 'dart:convert';

// import 'package:daily_scavenger/data/models/item/item_data.dart';
// import 'package:equatable/equatable.dart';

// // ignore: must_be_immutable
// class ItemRepo extends Equatable {
//   final ItemData item;

//   const ItemRepo({
//     required this.item,
   
//   });

//   ItemRepo copyWith({
//     ItemData? product,
   
//   }) {
//     return ItemRepo(
//       item: product ?? item,
     
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'items': item.toMap(),
//     };
//   }

//   factory ItemRepo.fromMap(Map<String, dynamic> map) {
//     return ItemRepo(
//       item: ItemData.fromMap(map['items'] as Map<String, dynamic>),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ItemRepo.fromJson(String source) =>
//       ItemRepo.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'OrderProduct(items: $item ';

//   @override
//   List<Object?> get props => [item];
// }
