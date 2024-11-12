import 'dart:io';


import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


// Define a box name for Hive
const String itemBoxName = 'items';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  void initState() {
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Data'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ItemData>(itemBoxName).listenable(),
        builder: (context, Box<ItemData> box, widget) {
           final itemData = box.get('currentItem');

          if (itemData == null) {
            return const Center(child: Text('No item data found'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (itemData.photoUrl != null)
                    Image.file(File(itemData.photoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),

                  Text('Name: ${itemData.name}'),
                  const SizedBox(height: 16.0),
                  Text('Form: ${itemData.form}'),
                  const SizedBox(height: 16.0),
                  Text('Description: ${itemData.description}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

