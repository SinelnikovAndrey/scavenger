// import 'dart:convert';

// import 'package:equatable/equatable.dart';
  
//   // ignore: must_be_immutable
//   class NewItemData extends Equatable {
//   String? id;
//   final String name;  
//   String color;
//   String form;
//   String? group;
//   String? description;
//   String? photoUrl;



//   NewItemData({
//     this.id,
//     required this.name,
//     required this.color,
//     required this.form,
//     this.group,
//     this.description,
//     this.photoUrl,
//     // this.group,
//     // this.description,
//     // this.photoUrl,
//   });

//   NewItemData copyWith({
//     String? id,
//     String? name,
//     String? color,
//     String? form,
//     String? group,
//     String? description,
//     String? photoUrl,
   
//   }) {
//     return NewItemData(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       color: color ?? this.color, 
//       form: form ?? this.form,
//       group: group ?? this.group,
//       description: description ?? this.description,
//       photoUrl: photoUrl ?? this.photoUrl,
//     );
//   }


//    Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'naidme': id,
//       'name': name,
//       'color': color,
//       'form': form,
//       'group': group, // enum to string
//       'description': description,
//       'photoUrl': photoUrl,
      
//     };
//   }

//   factory NewItemData.fromMap(Map<String, dynamic> map) {
//     return NewItemData(
//       id: map['id'] as String,
//       name: map['name'] as String,
//       color: map['color'] as String,
//       form: map['form'] as String,
//       group: map['group'] as String,
//       description: map['description'] != null ? map['description'] as String : null,
//       photoUrl: map['form'] as String,

//       // store: map['store'] as DocumentReference, 
//       // price: map['price'] as num,
//       // unit: unitFromName(map['unit'] as String),
//       // images: map['images'] != null
//       //     ? List<String>.from((map['images'] as List<dynamic>))
//       //     : null,
//       // category:
//       //     map['category'] != null ? map['category'] as DocumentReference : null,
//       // brand: map['brand'] != null ? map['brand'] as String : null,
//       // nutritions: map['nutritions'] is Map
//       //     ? Map<String, num>.from(map['nutritions'])
//       //     : null,
//       // createdAt: map['createdAt'].toDate(),
//       // updatedAt: map['updatedAt'].toDate(),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory NewItemData.fromJson(String source) =>
//       NewItemData.fromMap(json.decode(source) as Map<String, dynamic>);

//   bool get stringify => true;

//   List<Object?> get props {
//     return [
//       id,
//       name,
//       color,
//       form,
//       group,
//       description,
//       photoUrl,
      
//     ];
//   }
// }
