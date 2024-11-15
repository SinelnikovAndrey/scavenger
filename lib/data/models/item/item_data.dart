import 'dart:convert';

import 'package:hive/hive.dart';

part 'item_data.g.dart';

@HiveType(typeId: 0)
class ItemData extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  String color;

  @HiveField(3)
  String form;

  @HiveField(4)
  String group;

  @HiveField(5)
  String description;

  @HiveField(6)
  String? photoUrl;

  ItemData({
    required this.id,
    required this.name,
    required this.color,
    required this.form,
    required this.group,
    required this.description,
    this.photoUrl,
  });

  ItemData copyWith({
    String? id,
    String? name,
    String? color,
    String? form,
    String? group,
    String? description,
    String? photoUrl,
   
  }) {
    return ItemData(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color, 
      form: form ?? this.form,
      group: group ?? this.group,
      description: description ?? this.description,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }


   Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'naidme': id,
      'name': name,
      'color': color,
      'form': form,
      'group': group, // enum to string
      'description': description,
      'photoUrl': photoUrl,
      
    };
  }

  factory ItemData.fromMap(Map<String, dynamic> map) {
    return ItemData(
      id: map['id'] as String,
      name: map['name'] as String,
      color: map['color'] as String,
      form: map['form'] as String,
      group: map['group'] as String,
      description: map['description'] as String,
      photoUrl: map['form'] as String,

      // store: map['store'] as DocumentReference, 
      // price: map['price'] as num,
      // unit: unitFromName(map['unit'] as String),
      // images: map['images'] != null
      //     ? List<String>.from((map['images'] as List<dynamic>))
      //     : null,
      // category:
      //     map['category'] != null ? map['category'] as DocumentReference : null,
      // brand: map['brand'] != null ? map['brand'] as String : null,
      // nutritions: map['nutritions'] is Map
      //     ? Map<String, num>.from(map['nutritions'])
      //     : null,
      // createdAt: map['createdAt'].toDate(),
      // updatedAt: map['updatedAt'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemData.fromJson(String source) =>
      ItemData.fromMap(json.decode(source) as Map<String, dynamic>);

  bool get stringify => true;

  List<Object?> get props {
    return [
      id,
      name,
      color,
      form,
      group,
      description,
      photoUrl,
      
    ];
  }
}
