// Page for editing user data
import 'dart:io';

import 'package:daily_scavenger/data/models/user/user_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

const String userBoxName = 'users';


class UserEditPage extends StatefulWidget {
  final UserData userData;

  const UserEditPage({Key? key, required this.userData}) : super(key: key);

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _imagePicker = ImagePicker();
  File? _image;
  String? _imageUrl; 

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.userData.displayName;
    _emailController.text = widget.userData.email;
    _phoneController.text = widget.userData.phoneNumber;
    _imageUrl = widget.userData.photoUrl;
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
      final box = await Hive.openBox<UserData>(userBoxName);

      // Update the UserData object in Hive
      final updatedUser = UserData(
        id: widget.userData.id, 
        displayName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        photoUrl: _imageUrl,
      );
      await box.put(widget.userData.id.toString(), updatedUser);

      // Navigate back to the previous screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
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
                  controller: _emailController,
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
                  controller: _phoneController,
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