import 'package:daily_scavenger/data/models/category.dart';
import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/data/models/order_product.dart';
import 'package:daily_scavenger/data/models/product.dart';
import 'package:hive/hive.dart';

void registerAdapters() {
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(ItemDataAdapter()); 
}

class ItemDataAdapter extends TypeAdapter<ItemData> {
  @override
  final int typeId = 1;

  @override
  ItemData read(BinaryReader reader) {
    final id = reader.readInt();
    final name = reader.readString();
    final color = reader.readString();
    final form = reader.readString();
    final group = reader.readString();
    final description = reader.readString();
    final photoUrl = reader.readString();
    
    return ItemData(
      id: id, 
      name: name,
      color: color,
      form: form,
      group: group,
      description: description,
      photoUrl: photoUrl != '' ? photoUrl : null, 
    );
  }

  @override
  void write(BinaryWriter writer, ItemData obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.color);
    writer.writeString(obj.form);
    writer.writeString(obj.group);
    writer.writeString(obj.description);
    writer.writeString(obj.photoUrl ?? ''); // Write an empty string if photoUrl is null
  }
}
class PlaceDataAdapter extends TypeAdapter<PlaceData> {
  @override
  final int typeId = 2; 

  @override
  PlaceData read(BinaryReader reader) {
    final id = reader.readInt();
    final placeName = reader.readString();
    final saveDateTime = reader.read().asDateTime(); 
    final photoUrl = reader.readString(); // Read photoUrl

    return PlaceData(
      id: id,
      placeName: placeName,
      saveDateTime: saveDateTime,
      photoUrl: photoUrl, 
    );
  }

  @override
  void write(BinaryWriter writer, PlaceData obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.placeName);
    writer.write(obj.saveDateTime);
    writer.writeString(obj.photoUrl ?? ''); // Write photoUrl (null to empty string)
  }
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 3;

  @override
  Category read(BinaryReader reader) {
    return Category(
      name: reader.read(),
      description: reader.read(),
      image: reader.read(),
      createdAt: reader.read(),
      updatedAt: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer.write(obj.name);
    writer.write(obj.description);
    writer.write(obj.image);
    writer.write(obj.createdAt);
    writer.write(obj.updatedAt);
  }
}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 5;

  @override
  Product read(BinaryReader reader) {
    return Product(
      name: reader.read(),
      // store: reader.read(),
      description: reader.read(),
      price: reader.read(),
      // unit: unitFromName(reader.read()),
      images: reader.read(),
      // category: reader.read(),
      brand: reader.read(),
      nutritions: Map<String, num>.from(reader.read()),
      createdAt: reader.read(),
      updatedAt: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer.write(obj.name);
    // writer.write(obj.store);
    writer.write(obj.description);
    writer.write(obj.price);
    // writer.write(obj.unit.name);
    writer.write(obj.images);
    // writer.write(obj.category);
    writer.write(obj.brand);
    writer.write(obj.nutritions);
    writer.write(obj.createdAt);
    writer.write(obj.updatedAt);
  }
}



class OrderProductAdapter extends TypeAdapter<OrderProduct> {
  @override
  final int typeId = 6;

  @override
  OrderProduct read(BinaryReader reader) {
    return OrderProduct(
      product: reader.read(),
      quantity: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderProduct obj) {
    writer.write(obj.product);
    writer.write(obj.quantity);
  }
}

// class ItemDataAdapter extends TypeAdapter<ItemData> {
//   @override
//   final int typeId = 7;

//   @override
//   ItemData read(BinaryReader reader) {
//     final name = reader.readString();
//     final color = reader.readString();
//     final form = reader.readString();
//     final group = reader.readString();
//     final description = reader.readString();

//     return ItemData(
//       name: name,
//       color: color,
//       form: form,
//       group: group,
//       description: description,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ItemData obj) {
//     writer.writeString(obj.name);
//     writer.writeString(obj.color);
//     writer.writeString(obj.form);
//     writer.writeString(obj.group);
//     writer.writeString(obj.description);
//   }
// }