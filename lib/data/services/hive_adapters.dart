

// register adapters
import 'package:daily_scavenger/data/models/category.dart';
import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/data/models/order_product.dart';
import 'package:daily_scavenger/data/models/product.dart';
import 'package:daily_scavenger/data/models/user/user_data.dart';
import 'package:hive/hive.dart';

void registerAdapters() {
  // Hive.registerAdapter(AddressAdapter());
  // Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(UserDataAdapter());
  Hive.registerAdapter(ItemDataAdapter()); 
}




// class UserAdapter extends TypeAdapter<User> {
//   @override
//   final int typeId = 2;

//   @override
//   User read(BinaryReader reader) {
//     return User(
//       uid: reader.read(),
//       email: reader.read(),
//       displayName: reader.read(),
//       photoUrl: reader.read(),
//       phoneNumber: reader.read(),
//       address: reader.read(),
//       favoriteProducts: reader.read(),
//       favoriteStores: reader.read(),
//       createdAt: reader.read(),
//       updatedAt: reader.read(),
//     );
//   }

//   @override
//   void write(BinaryWriter writer, User obj) {
//     writer.write(obj.uid);
//     writer.write(obj.email);
//     writer.write(obj.displayName);
//     writer.write(obj.photoUrl);
//     writer.write(obj.phoneNumber);
//     writer.write(obj.address);
//     writer.write(obj.favoriteProducts);
//     writer.write(obj.favoriteStores);
//     writer.write(obj.createdAt);
//     writer.write(obj.updatedAt);
//   }
// }

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

class ItemDataAdapter extends TypeAdapter<ItemData> {
  @override
  final int typeId = 7;

  @override
  ItemData read(BinaryReader reader) {
    final name = reader.readString();
    final color = reader.readString();
    final form = reader.readString();
    final group = reader.readString();
    final description = reader.readString();

    return ItemData(
      name: name,
      color: color,
      form: form,
      group: group,
      description: description,
    );
  }

  @override
  void write(BinaryWriter writer, ItemData obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.color);
    writer.writeString(obj.form);
    writer.writeString(obj.group);
    writer.writeString(obj.description);
  }
}

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 1;

  @override
  UserData read(BinaryReader reader) {
    final id = reader.readInt();
    final displayName = reader.readString();
    final email = reader.readString();
    final phoneNumber = reader.readString();
    final photoUrl = reader.readString(); // Use readString() for both nullable and non-nullable strings
    
    // Handle empty string as null
    return UserData(
      id: id, 
      displayName: displayName,
      email: email,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl != '' ? photoUrl : null, 
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer.writeString(obj.displayName);
    writer.writeString(obj.email);
    writer.writeString(obj.phoneNumber);
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
    final saveDateTime = reader.read().asDateTime(); // Correctly read DateTime

    return PlaceData(
      id: id,
      placeName: placeName,
      saveDateTime: saveDateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PlaceData obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.placeName);
    writer.write(obj.saveDateTime); // Correctly write DateTime
  }
}