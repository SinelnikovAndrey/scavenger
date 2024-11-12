import 'dart:math';

import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart'; // Import for File handling



// Define a box name for Hive
const String itemBoxName = 'items';

class UserFormPage extends StatefulWidget {
  const UserFormPage({Key? key}) : super(key: key);

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _formController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imagePicker = ImagePicker();
  String? _imageUrl; 

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _formController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

   int _generateId() {
    final random = Random();
    return random.nextInt(1000000); // Adjust the range as needed
  }

  Future<void> _selectImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery, // or ImageSource.camera
    );
    if (pickedFile != null) {
      setState(() {
        _imageUrl = pickedFile.path; // Store image path locally
      });
    }
  }

  Future<void> _loadUserData() async {
    final box = await Hive.openBox<ItemData>(itemBoxName);
    final item = box.get('currentUser');
    if (item != null) {
      setState(() {
        _nameController.text = item.name;
        _formController.text = item.form;
        _descriptionController.text = item.description;
        _imageUrl = item.photoUrl; // Load image path from Hive
      });
    }
  }

  
  Future<void> _saveUser() async {
    if (_formKey.currentState!.validate()) {
      // Generate a unique ID
      final id = _generateId();

      // Update the UserData object in Hive
      final box = await Hive.openBox<ItemData>(itemBoxName);
      final updatedUser = ItemData(
        id: id, // Assign the generated ID
        photoUrl: _imageUrl, 
        name: _nameController.text.trim(), 
        color: '', 
        form: _formController.text.trim(),
        group: '', 
        description: _descriptionController.text.trim(), // Store the image path in Hive
      );
      await box.put(id.toString(), updatedUser); // Store by ID

      // Optionally, navigate back to the previous screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User'),
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
                // Text Fields for User Information
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Display Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a display name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _formController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: _saveUser,
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

