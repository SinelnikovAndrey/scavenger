// import 'dart:math';

// import 'package:daily_scavenger/data/models/item/item_data.dart';
// import 'package:daily_scavenger/data/models/new_items/new_item_data.dart';
// import 'package:daily_scavenger/main.dart';
// import 'package:daily_scavenger/widgets/buttons/default_button.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'dart:io';

// import 'package:image_picker/image_picker.dart'; // Import for File handling

// // Define a box name for Hive
// // const String itemBoxName = 'items';

// class AddItemPage extends StatefulWidget {
//   const AddItemPage({Key? key}) : super(key: key);

//   @override
//   State<AddItemPage> createState() => _AddItemPageState();
// }

// class _AddItemPageState extends State<AddItemPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _formController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   final _imagePicker = ImagePicker();
//   String? _imageUrl;

//   @override
//   void initState() {
//     super.initState();
//     _loadItemData();
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _formController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }

//   //  string _generateId() {
//   //   final random = Random();
//   //   return random.nextInt(1000000);
//   // }
//   String _generateId() {
//     var random = Random();
//     var randomNumber = random.nextInt(1000000);
//     return 'item_$randomNumber';
//   }

//   Future<void> _selectImage() async {
//     final pickedFile = await _imagePicker.pickImage(
//       source: ImageSource.gallery, // or ImageSource.camera
//     );
//     if (pickedFile != null) {
//       setState(() {
//         _imageUrl = pickedFile.path; // Store image path locally
//       });
//     }
//   }

//   Future<void> _loadItemData() async {
//     final box = await Hive.openBox(itemBoxName);
//     final item = box.get('items');
//     if (item != null) {
//       setState(() {
//         _nameController.text = item.name;
//         _formController.text = item.form;
//         _descriptionController.text = item.description!;
//         _imageUrl = item.photoUrl; // Load image path from Hive
//       });
//     }
//   }

//   // Future<void> _saveItem() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     final id = _generateId();

//   //     // final box = await Hive.openBox<ItemData>(itemBoxName);

//   //     ItemData updatedItem = (Hive.box<ItemData>('myBox').get('items') as ItemData).copyWith(
//   //       id: id, // Assign the generated ID
//   //       photoUrl: _imageUrl,
//   //       name: _nameController.text.trim(),
//   //       color: '',
//   //       form: _formController.text.trim(),
//   //       group: '',
//   //       description:
//   //           _descriptionController.text.trim(), // Store the image path in Hive
//   //     );
//   //     await Hive.box<ItemData>('myBox').put(
//   //       'items',
//   //       updatedItem,
//   //     );
//   //     // await box.put(id.toString(), updatedItem); // Store by ID

//   //     // Optionally, navigate back to the previous screen
//   //     Navigator.pop(context);
//   //   }
//   // }

//   // update hive
//   // ItemData user = (Hive.box('itemBox').get('currentItem') as ItemData).copyWith(
//   //   id: id, // Assign the generated ID
//   //   photoUrl: _imageUrl,
//   //    name: _nameController.text.trim(),
//   //   color: '',
//   //   form: _formController.text.trim(),
//   //  group: '',
//   //    description: _descriptionController.text.trim(),
//   // );

//   // await Hive.box('myBox').put(
//   //   'user',
//   //   user,
//   // );

//   // // hide loading
//   // if (context.mounted) {
//   //   Navigator.pop(context);
//   //   Navigator.pop(context);
//   // }
//   bool ignoring = false;
//   @override
//   Widget build(BuildContext context) {
//     return IgnorePointer(
//       ignoring: ignoring,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Update Item'),
//         ),
//         bottomNavigationBar: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
//           child: DefaultButton(
//             onTap: () async {
//               try {
//                 setState(() {
//                   ignoring = true;
//                 });
      
//                 // show loading
//                 showDialog(
//                   context: context,
//                   barrierDismissible: false,
//                   builder: (context) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   },
//                 );
      
//                 if (_formKey.currentState!.validate()) {
                 
      
//                   // // update user
//                   // await FirebaseFirestoreService().updateDocumentWithQuery(
//                   //   collection: 'users',
//                   //   field: 'uid',
//                   //   value: Hive.box('myBox').get('user').uid,
//                   //   data: {
//                   //     'displayName': _nameController.text.trim(),
//                   //     'email': _emailController.text.trim(),
//                   //     'phoneNumber': _phoneController.text.trim(),
//                   //     'photoUrl': imageUrl,
//                   //   },
//                   // );
//                     final id = _generateId();
//                   // update hive
//                   NewItemData updatedItem =
//                       (Hive.box('myBox').get('items') as NewItemData)
//                           .copyWith(
//                     id: id, // Assign the generated ID
//                     photoUrl: _imageUrl,
//                     name: _nameController.text.trim(),
//                     color: 'cooll',
//                     form: _formController.text.trim(),
//                     group: 'cool',
//                     description: _descriptionController.text
//                         .trim(), // Store the image path in Hive
//                   );
//                   await Hive.box('myBox').put(
//                     'items',
//                     updatedItem,
//                   );
      
//                   // hide loading
//                   if (context.mounted) {
//                     Navigator.pop(context);
//                     Navigator.pop(context);
//                   }
      
//                   setState(() {
//                     ignoring = false;
//                   });
//                 }
//               } catch (e, s) {
//                 debugPrintStack(label: e.toString(), stackTrace: s);
      
//                 // hide loading
//                 if (context.mounted) {
//                   Navigator.pop(context);
//                 }
      
//                 setState(() {
//                   ignoring = false;
//                 });
      
//                 // show error
//                 if (context.mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(e.toString()),
//                     ),
//                   );
//                 }
//               }
//             },
//             text: 'Save',
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Image Preview (if an image is selected)
//                   if (_imageUrl != null)
//                     Image.file(File(_imageUrl!),
//                         height: 200, width: double.infinity, fit: BoxFit.cover),
//                   // Button to choose image
//                   ElevatedButton(
//                     onPressed: _selectImage,
//                     child: const Text('Choose Image'),
//                   ),
//                   const SizedBox(height: 16.0),
      
//                   TextFormField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(labelText: 'Display Name'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a display name';
//                       }
//                       return 'null';
//                     },
//                   ),
//                   const SizedBox(height: 16.0),
//                   TextFormField(
//                     controller: _formController,
//                     decoration: const InputDecoration(labelText: 'Email'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter an email';
//                       }
//                       return 'null';
//                     },
//                   ),
//                   const SizedBox(height: 16.0),
//                   TextFormField(
//                     controller: _descriptionController,
//                     decoration: const InputDecoration(labelText: 'Phone Number'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a phone number';
//                       }
//                       return 'null';
//                     },
//                   ),
//                   // const SizedBox(height: 32.0),
//                   // ElevatedButton(
//                   //   onPressed: _saveItem,
//                   //   child: const Text('Save Changes'),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }







import 'dart:math';

// import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/data/models/new_items/new_item_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart'; // Import for File handling



// Define a box name for Hive
const String itemBoxName = 'myBox';

class AddItemPage extends StatefulWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _formController = TextEditingController();
  final _groupController = TextEditingController();
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
    _groupController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String _generateId() {
    var random = Random();
    var randomNumber = random.nextInt(1000000);
    return 'item_$randomNumber';
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
        _formController.text = item.form!;
        _groupController.text = item.group!;
        _descriptionController.text = item.description!;
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

