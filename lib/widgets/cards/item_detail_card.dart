import 'dart:io';

import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:flutter/material.dart';

class ItemDetailCard extends StatelessWidget {
  final ItemData item;
  const ItemDetailCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // ItemRepo orderProduct = ItemRepo(
    //   item: item,
    // );

    return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.photoUrl != null)
              Image.file(File(item.photoUrl!),
                  height: 120, width: 120, fit: BoxFit.cover),
                    const SizedBox(height: 16.0),
                    Text('Name: ${item.name}'),
                    const SizedBox(height: 16.0),
                    Text('Form: ${item.form}'),
                    const SizedBox(height: 16.0),
                    Text('Group: ${item.group}'),
                    const SizedBox(height: 16.0),
                    Text('Description Number: ${item.description}'),
                    
                  ],
                ),
              );
  }
}
