// import 'package:daily_scavenger/data/models/item/item_data.dart';
// // import 'package:daily_scavenger/data/models/item/item_repo.dart';
// import 'package:hive/hive.dart';

// class ItemRepository {
//   // final Box<ItemData> _itemBox;
//   static final List<ItemData> listItems = [];
//   static var box = Hive.box('myBox');

  // ItemRepository(this._itemBox);

//   static void loadItem() {
//     if (box.containsKey('currenItem')) {
//       final List<ItemData> hiveItem =
//           List<ItemData>.from(box.get('currenItem'));
//       listItems.clear();
//       for (ItemData currentItem in hiveItem) {
//         // Rename the variable
//         listItems.add(currentItem); // Correctly add to the list
//       }
//     }
//   }

//   Future<List<ItemData>> fetchExclusiveProducts() async {
//     var snapshot = await _firebaseFirestoreService.getDocumentsWithQuery(
//       'products',
//       'category',
//       null,
//     );

//     return snapshot.docs
//         .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>)
//             .copyWith(id: doc.id)) // set the product ID to the document ID
//         .toList();
//   }

// Future<void> addItem(ItemData itemData) async {
//     final itemId = _generateId();
//     itemData.id = itemId;
//     await _itemBox.put(itemId.toString(), itemData);
//   }
  // Future<List<ItemData>> getItems() async {
  //   return _itemBox.values.toList().cast<ItemData>();
  // }

  // Future<ItemData?> getItemById(int id) async {
  //   return _itemBox.get(id.toString());
  // }

  // Future<void> updateItem(ItemData itemData) async {
  //   await _itemBox.put(itemData.id.toString(), itemData);
  // }

  // Future<void> deleteItem(int id) async {
  //   await _itemBox.delete(id.toString());
  // }

  // int _generateId() {
  //   // Generate a unique ID (e.g., using a counter or UUID)
  //   // This is just a simple example. Consider using a more robust method.
  //   return DateTime.now().microsecondsSinceEpoch;
  // }

  // // get product quantity in cart
  // static num getQuantity(Product product) {
  //   for (OrderProduct item in cart) {
  //     if (item.product == product) {
  //       return item.quantity;
  //     }
  //   }
  //   return 0;
  // }

  // // get total price of cart
  // static double getTotalPrice() {
  //   double total = 0;
  //   for (OrderProduct item in cart) {
  //     total += item.product.price * item.quantity;
  //   }
  //   return total;
  // }

  // update cart in hive
  // Future<void> updateHive() async {
  //   await box.put('itemBox', cart);
  // }

  // update cart
  // Future<void> updateItemsList(ItemRepo item,) async {
  //   // guard clause
  //   // if (quantity < 0) return;

  //   // check if product already in cart
  //   if (listItems.contains(item)) {
  //     // update quantity
  //     listItems[listItems.indexOf(item)].quantity = quantity;

  //     // remove if quantity is 0
  //     if (quantity == 0) {
  //       cart.remove(product);
  //     }
  //   } else {
  //     // add to cart
  //     product.quantity = quantity;
  //     cart.add(product);
  //   }
  //   await updateHive();
  // }

  // static void loadItem() {}
// }


