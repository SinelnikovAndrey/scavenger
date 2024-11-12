import 'dart:io';

import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

const String itemBoxName = 'items';


class EditItemPage extends StatefulWidget {
  final ItemData itemData;

  const EditItemPage({Key? key, required this.itemData}) : super(key: key);

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _formController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imagePicker = ImagePicker();
  File? _image;
  String? _imageUrl; 

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.itemData.name;
    _formController.text = widget.itemData.form;
    _descriptionController.text = widget.itemData.description;
    _imageUrl = widget.itemData.photoUrl;
  }

  Future<void> _selectImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery, // or ImageSource.camera
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imageUrl = pickedFile.path;
      });
    }
  }

  Future<void> _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      final box = await Hive.openBox<ItemData>(itemBoxName);

      // Update the ItemData object in Hive
      final updatedItem = ItemData(
        id: widget.itemData.id, 
        name: _nameController.text.trim(),
        form: _formController.text.trim(),
        description: _descriptionController.text.trim(),
        photoUrl: _imageUrl, 
        color: '', 
        group: '',
      );
      await box.put(widget.itemData.id.toString(), updatedItem);

      // Navigate back to the previous screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Item'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Preview (if an image is selected)
                if (_imageUrl != null)
                  Image.file(File(_imageUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),
                // Button to choose image
                ElevatedButton(
                  onPressed: _selectImage,
                  child: const Text('Choose Image'),
                ),
                const SizedBox(height: 16.0),
                // Text Fields for Item Information
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _formController,
                  decoration: const InputDecoration(labelText: 'Form'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a form';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: _saveChanges,
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}