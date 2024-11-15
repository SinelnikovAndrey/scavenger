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
import 'package:daily_scavenger/presentation/utils/app_colors.dart';
import 'package:daily_scavenger/presentation/utils/app_fonts.dart';
import 'package:daily_scavenger/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart'; // Import for File handling

// Define a box name for Hive
const String itemBoxName = 'myBox';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _colorController = TextEditingController();
  final _formController = TextEditingController();
  final _groupController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _imagePicker = ImagePicker();
  String? _imageUrl;

  String selectedColorName = 'Grey'; // Initial color
  final Map<String, Color> colorMap = {
    'Red': Colors.red,
    'Grey': Colors.grey,
    'Black': Colors.black,
    'Brown': Colors.brown,
    'Blue': Colors.blue,
    'Green': Colors.green,
    'Yellow': Colors.yellow,
  };

  @override
  void initState() {
    super.initState();
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
        color: selectedColorName,
        form: _formController.text.trim(),
        group: _groupController.text.trim(),
        description:
            _descriptionController.text.trim(), // Store the image path in Hive
      );
      await box.put(id.toString(), updatedUser); // Store by ID

      // Optionally, navigate back to the previous screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Item'),
        centerTitle: true,
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
                // if (_imageUrl != null)
                // Button to choose image
                GestureDetector(
                  onTap: _selectImage,
                  child: _imageUrl != null
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.gray,
                          ),
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Image.file(File(_imageUrl!),
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.darkBorderGray,
                          ),
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Center(
                              child: Text(
                            '+ Add Photo',
                            style: AppFonts.h6,
                          )),
                        ),
                ),

                const SizedBox(height: 20.0),
                // Text Fields for User Information

                /////////FORM------FORM////////
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Name',
                    style: AppFonts.h6,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Add name',
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  )
                                  // labelText: 'Add name', labelStyle: TextStyle(color: AppColors.darkBorderGray,),
                                  ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Color',
                    style: AppFonts.h6,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.68,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: DropdownButton<String>(
                            value: selectedColorName,
                            onChanged: (String? newColorName) {
                              setState(() {
                                selectedColorName = newColorName!;
                              });
                            },
                            items: colorMap.keys.map((colorName) {
                              return DropdownMenuItem<String>(
                              
                                value: colorName,
                                child: Text(colorName),
                              );
                            }).toList(),
                            underline: Container(),
                            menuWidth: MediaQuery.of(context).size.width * 0.7,
                            
                          ),
                          
                        ),
                      ),
                      const SizedBox(width: 10),
                      ColorBox(color: colorMap[selectedColorName]!),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Format',
                    style: AppFonts.h6,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: TextFormField(
                          controller: _formController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add format',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a format';
                            }
                            return null;
                          },
                        ),
                      )),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Group',
                    style: AppFonts.h6,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: TextFormField(
                          controller: _groupController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add group',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a group';
                            }
                            return null;
                          },
                        ),
                      )),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Description',
                    style: AppFonts.h6,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: TextFormField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add description',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                      )),
                  const SizedBox(height: 20.0),
                  
                  const SizedBox(height: 20.0),
                ]),

                DefaultButton(
                  text: 'Add',
                  onTap: _saveUser,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final Color color;

  const ColorBox({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
