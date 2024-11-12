import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String name;
  final String? description;
  final num price;
  final List<String>? images;
  final String? brand;
  final Map<String, num>? nutritions;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    this.id,
    required this.name,
    this.description,
    required this.price,
    this.images,
    this.brand,
    this.nutritions,
    required this.createdAt,
    required this.updatedAt,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    num? price,
    List<String>? images,
    String? brand,
    Map<String, num>? nutritions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      images: images ?? this.images,
      brand: brand ?? this.brand,
      nutritions: nutritions ?? this.nutritions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'images': images,
      'brand': brand,
      'nutritions': nutritions,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] as num,
      images: map['images'] != null
          ? List<String>.from((map['images'] as List<dynamic>))
          : null,

      brand: map['brand'] != null ? map['brand'] as String : null,
      nutritions: map['nutritions'] is Map
          ? Map<String, num>.from(map['nutritions'])
          : null,
      createdAt: map['createdAt'].toDate(),
      updatedAt: map['updatedAt'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      price,
      images,
      brand,
      nutritions,
      createdAt,
      updatedAt,
    ];
  }
}
