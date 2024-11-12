// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'dart:io';

// import 'package:image_picker/image_picker.dart'; // Import for File handling

// // Define a model for your user data
// class UserData {
//   String displayName;
//   String email;
//   String phoneNumber;
//   String? photoUrl; // Can be null if no image is uploaded

//   UserData({
//     required this.displayName,
//     required this.email,
//     required this.phoneNumber,
//     this.photoUrl,
//   });
// }

// // Define a box name for Hive
// const String userBoxName = 'users';

// class UserFormPage extends StatefulWidget {
//   const UserFormPage({Key? key}) : super(key: key);

//   @override
//   State<UserFormPage> createState() => _UserFormPageState();
// }

// class _UserFormPageState extends State<UserFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _imagePicker = ImagePicker();
//   File? _image;
//   String? _imageUrl; 

//   @override
//   void initState() {
//     super.initState();
//     // Initialize Hive
//     Hive.initFlutter();
//     Hive.registerAdapter(UserDataAdapter());
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }

//   Future<void> _selectImage() async {
//     final pickedFile = await _imagePicker.pickImage(
//       source: ImageSource.gallery, // or ImageSource.camera
//     );
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _saveUser() async {
//     if (_formKey.currentState!.validate()) {
//       // Update the UserData object in Hive
//       final box = await Hive.openBox<UserData>(userBoxName);
//       final existingUser = box.get('currentUser'); // Retrieve existing user

//       // Create a new UserData object with updated values
//       final updatedUser = UserData(
//         displayName: _nameController.text.trim(),
//         email: _emailController.text.trim(),
//         phoneNumber: _phoneController.text.trim(),
//         photoUrl: _imageUrl, // Use the locally stored photoUrl
//       );

//       // Update the user in Hive
//       if (existingUser != null) {
//         box.put('currentUser', updatedUser); // Update existing user
//       } else {
//         box.put('currentUser', updatedUser); // Create new user if none exists
//       }

//       // Optionally, navigate back to the previous screen
//       Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Update User'),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Image Preview (if an image is selected)
//                 if (_image != null)
//                   Image.file(_image!, height: 200, width: double.infinity, fit: BoxFit.cover),
//                 // Button to choose image
//                 ElevatedButton(
//                   onPressed: _selectImage,
//                   child: const Text('Choose Image'),
//                 ),
//                 const SizedBox(height: 16.0),
//                 // Text Fields for User Information
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Display Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a display name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(labelText: 'Email'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter an email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _phoneController,
//                   decoration: const InputDecoration(labelText: 'Phone Number'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a phone number';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 32.0),
//                 ElevatedButton(
//                   onPressed: _saveUser,
//                   child: const Text('Save Changes'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Adapter for UserData to work with Hive
// class UserDataAdapter extends TypeAdapter<UserData> {
//   @override
//   final int typeId = 1;

//   @override
//   UserData read(BinaryReader reader) {
//     final displayName = reader.readString();
//     final email = reader.readString();
//     final phoneNumber = reader.readString();
//     final photoUrl = reader.readNullableString(); // Handle nullable photoUrl

//     return UserData(
//       displayName: displayName,
//       email: email,
//       phoneNumber: phoneNumber,
//       photoUrl: photoUrl,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, UserData obj) {
//     writer.writeString(obj.displayName);
//     writer.writeString(obj.email);
//     writer.writeString(obj.phoneNumber);
//     writer.writeNullableString(obj.photoUrl); // Handle nullable photoUrl
//   }
// }