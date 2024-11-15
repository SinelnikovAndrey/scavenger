import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:math';
// import 'package:intl/intl.dart'; // Import for formatting date and time

int _generateId() {
  final random = Random();
  return random.nextInt(1000000);
}

// Page for adding place data
// Page for adding place data
class AddPlacePage extends StatefulWidget {
  final String? itemId;

  const AddPlacePage({
    super.key,
    required this.itemId,
  });

  @override
  State<AddPlacePage> createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final _formKey = GlobalKey<FormState>(); // Remains final
  final _placeNameController = TextEditingController(); // Remains final
  late Box<ItemData> itemBox;
  late ItemData itemData;
  
 
  @override
  void initState() {
    super.initState();
    itemBox = Hive.box<ItemData>(itemBoxName);
    itemData = itemBox.get(widget.itemId.toString()) ??
        ItemData(
            name: '',
            photoUrl: '',
            id: '',
            color: '',
            form: '',
            group: '',
            description: '');
  }

  @override
  void dispose() {
    _placeNameController.dispose();
    super.dispose();
  }

  Future<void> _savePlace() async {
    if (_formKey.currentState!.validate()) {
      // Accessing _formKey correctly
      final placeId = _generateId();
      final placeData = HistoryData(
        id: placeId,
      placeName: _placeNameController.text.trim(), 
      saveDateTime: DateTime.now(),
      photoUrl: itemData.photoUrl, 
      itemName: itemData.name, // Get name from itemData
      itemColor: itemData.color , // Get color from itemData
      itemForm: itemData.form, // Get form from itemData
      itemGroup: itemData.group, // Get group from itemData
      itemDescription: itemData.description, 
      fetchDate: DateTime.now().toString(), 
      fetchTime: DateTime.now().toString(), // Get description from itemData
      );

      final placeBox = await Hive.openBox<HistoryData>(placeBoxName);
      await placeBox.put(placeId.toString(), placeData);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Using _formKey correctly
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller:
                    _placeNameController, // Using _placeNameController correctly
                decoration: const InputDecoration(labelText: 'Place Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a place name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _savePlace,
                child: const Text('Save Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
