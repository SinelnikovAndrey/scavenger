import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/presentation/pages/history_item/add_place.dart';
import 'package:daily_scavenger/presentation/pages/item_page/edit_item.dart';
import 'package:flutter/material.dart';
import 'dart:io'; 


const String itemBoxName = 'items';
class ItemDetailPage extends StatelessWidget {
  final ItemData itemData;

  const ItemDetailPage({Key? key, required this.itemData, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item ${itemData.id}'), 
        
        actions: [
          ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditItemPage(itemData: itemData),
              ),
            );
          },
          child: const Text('Edit Item'),
        ),
        ],
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (itemData.photoUrl != null)
              Image.file(File(itemData.photoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16.0),
            Text('Name: ${itemData.name}'),
            const SizedBox(height: 16.0),
            Text('Form: ${itemData.form}'),
            const SizedBox(height: 16.0),
            Text('Description Number: ${itemData.description}'),

            Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPlacePage(itemId: itemData.id),
                  ),
                );
              },
              child: const Text('Add Place'),
            ),
          ),
          ],

        ),
      ),
    );
  }
}
