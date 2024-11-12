// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:nectar/src/data/models/user.dart';
// import 'package:nectar/src/data/services/firebase_firestore_service.dart';
// import 'package:nectar/src/data/services/firebase_storage_service.dart';
// import 'package:nectar/src/presentation/utils/helpers.dart';
// import 'package:nectar/src/presentation/widgets/buttons/default_button.dart';

// class MyDetailsPage extends StatefulWidget {
//   const MyDetailsPage({super.key});

//   @override
//   State<MyDetailsPage> createState() => _MyDetailsPageState();
// }

// class _MyDetailsPageState extends State<MyDetailsPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController(
//     text: Hive.box('myBox').get('user').displayName,
//   );
//   final _emailController = TextEditingController(
//     text: Hive.box('myBox').get('user').email,
//   );
//   final _phoneController = TextEditingController(
//     text: Hive.box('myBox').get('user').phoneNumber,
//   );

//   XFile? _image;
//   String? imageUrl = Hive.box('myBox').get('user').photoUrl;

//   bool ignoring = false;

//   @override
//   Widget build(BuildContext context) {
//     return IgnorePointer(
//       ignoring: ignoring,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('My Details'),
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

//                 // if (_formKey.currentState!.validate()) {
//                 //   // upload image
//                 //   if (_image != null) {
//                 //     await FirebaseStorageService()
//                 //         .uploadFile(
//                 //       'users/${Hive.box('myBox').get('user').uid}',
//                 //       File(_image!.path),
//                 //     )
//                 //         .then((value) {
//                 //       imageUrl = value;
//                 //       setState(() {});
//                 //     });
//                 //   }

//                 //   // update user
//                 //   await FirebaseFirestoreService().updateDocumentWithQuery(
//                 //     collection: 'users',
//                 //     field: 'uid',
//                 //     value: Hive.box('myBox').get('user').uid,
//                 //     data: {
//                 //       'displayName': _nameController.text.trim(),
//                 //       'email': _emailController.text.trim(),
//                 //       'phoneNumber': _phoneController.text.trim(),
//                 //       'photoUrl': imageUrl,
//                 //     },
//                 //   );

//                   // // update hive
//                   // User user = (Hive.box('myBox').get('user') as User).copyWith(
//                   //   displayName: _nameController.text.trim(),
//                   //   email: _emailController.text.trim(),
//                   //   phoneNumber: _phoneController.text.trim(),
//                   //   photoURL: imageUrl,
//                   // );

//                   // await Hive.box('myBox').put(
//                   //   'user',
//                   //   user,
//                   // );

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
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 16),
//                   // image
//                   GestureDetector(
//                     onTap: () {
//                       // show dialog
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: const Text('Select Image'),
//                             content: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 ListTile(
//                                   onTap: () async {
//                                     Navigator.pop(context);
//                                     // open camera
//                                     _image = await ImagePicker().pickImage(
//                                       source: ImageSource.camera,
//                                       imageQuality: 30,
//                                     );
//                                     setState(() {});
//                                   },
//                                   leading: const Icon(Icons.camera),
//                                   title: const Text('Camera'),
//                                 ),
//                                 ListTile(
//                                   onTap: () async {
//                                     Navigator.pop(context);
//                                     // open gallery
//                                     _image = await ImagePicker().pickImage(
//                                       source: ImageSource.gallery,
//                                       imageQuality: 30,
//                                     );
//                                     setState(() {});
//                                   },
//                                   leading: const Icon(Icons.photo),
//                                   title: const Text('Gallery'),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     },
//                     child: Center(
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundImage: (_image != null)
//                             ? FileImage(
//                                 File(_image!.path),
//                               ) as ImageProvider<Object>?
//                             : (imageUrl != null && imageUrl!.isNotEmpty)
//                                 ? CachedNetworkImageProvider(imageUrl!)
//                                 : null,
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     'Name',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter your name',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Email',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter your email',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return 'Please enter your email';
//                       } else if (!isValidEmail(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Phone',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _phoneController,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter your phone number',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return 'Please enter your phone number';
//                       }
//                       return null;
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'dart:io';
// import 'package:daily_scavenger/data/services/image_service.dart';
// import 'package:daily_scavenger/presentation/utils/helpers.dart';
// import 'package:daily_scavenger/widgets/buttons/default_button.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:image_picker/image_picker.dart';


// class AddItemPage extends StatefulWidget {
//   const AddItemPage({super.key});

//   @override
//   State<AddItemPage> createState() => _AddItemPageState();
// }

// class _AddItemPageState extends State<AddItemPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController(
//   text: Hive.box('myBox').get('user')?.displayName ?? '',
// );
//   final _emailController = TextEditingController(
//     text: Hive.box('myBox').get('user')?.email ?? '',
//   );
//   final _phoneController = TextEditingController(
//     text: Hive.box('myBox').get('user')?.phoneNumber ?? '',
//   );

//   XFile? _image;
//   String? imageUrl = Hive.box('myBox').get('user')?.photoUrl ?? '';

//   bool ignoring = false;

//   final _imageService = ImageService();
//   final ImagePicker _picker = ImagePicker();
//   XFile? _selectedImage;
//   List<String> _imagePaths = []; // To store retrieved image paths

//   Future<void> _getImageFromSource(ImageSource source) async {
//     final XFile? pickedImage = await _picker.pickImage(source: source);
//     setState(() {
//       _selectedImage = pickedImage;
//     });

//     if (_selectedImage != null) {
//       // Save the image path
//       await _imageService.saveImagePath(_selectedImage!.path);
//       setState(() {});
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchImages(); // Call the function to retrieve images when the screen loads
//   }

//   Future<void> _fetchImages() async {
//     final imagePaths = await _imageService.getAllImagePaths();
//     setState(() {
//       _imagePaths = imagePaths;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IgnorePointer(
//       ignoring: ignoring,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('My Details'),
//         ),
//         bottomNavigationBar: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
//           child: DefaultButton(
//             onTap: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: const Text('Choose Image Source'),
//                               content: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   ListTile(
//                                     leading: const Icon(Icons.photo_library),
//                                     title: const Text('Gallery'),
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                       _getImageFromSource(ImageSource.gallery);
//                                     },
//                                   ),
//                                   ListTile(
//                                     leading: const Icon(Icons.camera_alt),
//                                     title: const Text('Camera'),
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                       _getImageFromSource(ImageSource.camera);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//             text: 'Save',
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 16),
//                   // image
//                   GestureDetector(
//                     onTap: () {
//                       // show dialog
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: const Text('Select Image'),
//                             content: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 ListTile(
//                                   onTap: () async {
//                                     Navigator.pop(context);
//                                     // open camera
//                                     _image = await ImagePicker().pickImage(
//                                       source: ImageSource.camera,
//                                       imageQuality: 30,
//                                     );
//                                     setState(() {});
//                                   },
//                                   leading: const Icon(Icons.camera),
//                                   title: const Text('Camera'),
//                                 ),
//                                 ListTile(
//                                   onTap: () async {
//                                     Navigator.pop(context);
//                                     // open gallery
//                                     _image = await ImagePicker().pickImage(
//                                       source: ImageSource.gallery,
//                                       imageQuality: 30,
//                                     );
//                                     setState(() {});
//                                   },
//                                   leading: const Icon(Icons.photo),
//                                   title: const Text('Gallery'),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     },
//                     child: SizedBox(
//                 // height:  MediaQuery.of(context).size.height,
//                 height: 460,
//                 child: CustomScrollView(
//                   slivers: [
//                     SliverList(
//                       // For other content above the grid
//                       delegate: SliverChildListDelegate(
//                         [
//                           // Your other widgets
//                         ],
//                       ),
//                     ),
//                     SliverPadding(
//                       // Add padding to the grid if needed
//                       padding: const EdgeInsets.all(10), // Example padding
//                       sliver: SliverGrid.builder(
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                         ),
//                         itemCount: _imagePaths.length,
//                         itemBuilder: (context, index) {
//                           return Image.file(
//                             File(_imagePaths[index]),
//                             fit: BoxFit.cover,
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//                   ),
                  
//                   const Text(
//                     'Name',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter your name',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Email',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter your email',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return 'Please enter your email';
//                       } else if (!isValidEmail(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Phone',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _phoneController,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter your phone number',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return 'Please enter your phone number';
//                       }
//                       return null;
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
