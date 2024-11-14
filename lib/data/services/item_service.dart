import 'dart:math';

import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/data/models/item/item_repo.dart';
import 'package:hive/hive.dart';

class ItemService {
  final Box<ItemData> itemBox;

  ItemService(this.itemBox);
  // static var box = Hive.box('myBox');
  // static final List<ItemRepo> listItems = [];


  // ItemService(this._itemBox);

  // Add a new item to the box
  // Future<List<ItemData>> addItem(ItemData itemData) async {
  //   final itemId = _generateId();
  //   itemData.id = itemId;
  //   await itemBox.put(itemId.toString(), itemData);
  // }

  //  static void loadItems() {
  //   if (box.containsKey('items')) {
  //     final List<ItemRepo> hiveListItems =
  //         List<ItemRepo>.from(box.get('items'));
  //     listItems.clear();
  //     for (ItemRepo item in hiveListItems) {
  //       listItems.add(item);
  //     }
  //   }
  // }
//   Future<List<ItemData>> addItem(ItemData itemData) async {
//   final itemId = _generateId();
//   itemData.id = itemId;
//   await itemBox.put(itemId.toString(), itemData);

//   // Return a list containing all the items (including the newly added one)
//   return itemBox.values.toList().cast<ItemData>();
// }

  // Get all items from the box
  Future<List<ItemData>> getItems() async {
    return itemBox.values.toList().cast<ItemData>();
  }

  // Get a specific item by its ID
  Future<ItemData?> getItemById(int id) async {
    return itemBox.get(id.toString());
  }

  // Update an existing item
  Future<void> updateItem(ItemData itemData) async {
    await itemBox.put(itemData.id.toString(), itemData);
  }

  // Delete an item by its ID
  Future<void> deleteItem(int id) async {
    await itemBox.delete(id.toString());
  }

  // Generate a unique ID for a new item
  String _generateId() {
    
    var random = Random();
    var randomNumber = random.nextInt(1000000);
    return 'item_$randomNumber'; 
  }
}