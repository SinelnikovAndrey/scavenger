import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; 
import 'dart:io';
import 'package:image_picker/image_picker.dart';

// ... Your ItemData, PlaceData models, and other pages ...

const String historyBoxName = 'places';

class EditHistoryPage extends StatefulWidget {
  final HistoryData placeData;

  const EditHistoryPage({super.key, required this.placeData});

  @override
  State<EditHistoryPage> createState() => _EditHistoryPageState();
}

class _EditHistoryPageState extends State<EditHistoryPage> {
  final _formKey = GlobalKey<FormState>();
  final _placeNameController = TextEditingController();
  final _placeDescriptionController = TextEditingController();
  final _placePhotoUrlController = TextEditingController(); 
  DateTime _selectedDateTime = DateTime.now();
  String? _selectedImagePath; // Path to the selected image
  late Box<HistoryData> placeBox; // Declare placeBox

  @override
  void initState() {
    super.initState();
    placeBox = Hive.box<HistoryData>(historyBoxName); 
    _placeNameController.text = widget.placeData.placeName;
    _placeDescriptionController.text = widget.placeData.placeDescription ?? '';
    _placePhotoUrlController.text = widget.placeData.placePhotoUrl ?? ''; 
    _selectedDateTime = widget.placeData.saveDateTime;
  }

  @override
  void dispose() {
    _placeNameController.dispose();
    _placeDescriptionController.dispose();
    _placePhotoUrlController.dispose();
    // placeBox.close(); // Close the box when disposing
    super.dispose();
  }

  Future<void> _updatePlace() async {
  if (_formKey.currentState!.validate()) {
    final updatedPlaceData = HistoryData(
      id: widget.placeData.id,
      placeName: _placeNameController.text.trim(),
      saveDateTime: _selectedDateTime,
      photoUrl: widget.placeData.photoUrl, 
      placeDescription: _placeDescriptionController.text.trim(),
      itemName: widget.placeData.itemName,
      itemColor: widget.placeData.itemColor,
      itemForm: widget.placeData.itemForm,
      itemGroup: widget.placeData.itemGroup,
      itemDescription: widget.placeData.itemDescription,
      placePhotoUrl: _selectedImagePath ?? widget.placeData.placePhotoUrl,
       fetchDate: _selectedDateTime.toString(), 
       fetchTime: _selectedDateTime.toString(), 
    );

    final placeBox = await Hive.openBox<HistoryData>(historyBoxName);
    await placeBox.put(widget.placeData.id.toString(), updatedPlaceData);

    // Trigger a rebuild of the widget to reflect the changes
    setState(() {}); 
  }
}

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImagePath = pickedFile.path;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDateTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.placeData.itemName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.placeData.photoUrl != null) // Show the saved place photo
                  Image.file(File(widget.placeData.photoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _placeNameController,
                  decoration: const InputDecoration(labelText: 'Place Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a place name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _placeDescriptionController,
                  decoration: const InputDecoration(labelText: 'Place Description'),
                  maxLines: 3,
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    if (widget.placeData.placePhotoUrl != null)
                  Image.file(File(widget.placeData.placePhotoUrl!), height: 100, width: 100, fit: BoxFit.cover),
              const SizedBox(height: 16.0),
                    const SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: _selectImage,
                      child: const Text('Choose Image'),
                    ),
                  ],
                ),
                if (_selectedImagePath != null) // Show the selected image from gallery
                  Image.file(File(_selectedImagePath!), height: 100, width: 100, fit: BoxFit.cover),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Save Date: ${DateFormat('dd/MM/yyyy').format(_selectedDateTime)}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _selectDate(context),
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: _updatePlace,
                  child: const Text('Update Place'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:intl/intl.dart'; 
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:daily_scavenger/data/models/history/history_data.dart';

// // ... Your ItemData, PlaceData models, and other pages ...

// const String historyBoxName = 'places';

// class EditHistoryPage extends StatefulWidget {
//   final PlaceData placeData;

//   const EditHistoryPage({Key? key, required this.placeData}) : super(key: key);

//   @override
//   State<EditHistoryPage> createState() => _EditHistoryPageState();
// }

// class _EditHistoryPageState extends State<EditHistoryPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _placeNameController = TextEditingController();
//   final _placeDescriptionController = TextEditingController();
//   final _placePhotoUrlController = TextEditingController(); 
//   DateTime _selectedDateTime = DateTime.now();
//   String? _selectedImagePath; // Path to the selected image

//   @override
//   void initState() {
//     super.initState();
//     _placeNameController.text = widget.placeData.placeName;
//     _placeDescriptionController.text = widget.placeData.placeDescription ?? '';
//     _placePhotoUrlController.text = widget.placeData.placePhotoUrl ?? ''; // Assuming placePhotoUrl is a String
//     _selectedDateTime = widget.placeData.saveDateTime;
//   }

//   @override
//   void dispose() {
//     _placeNameController.dispose();
//     _placeDescriptionController.dispose();
//     _placePhotoUrlController.dispose();
//     super.dispose();
//   }

//   Future<void> _updatePlace() async {
//     if (_formKey.currentState!.validate()) {
//       final updatedPlaceData = PlaceData(
//         id: widget.placeData.id,
//         placeName: _placeNameController.text.trim(),
//         saveDateTime: _selectedDateTime,
//         photoUrl: widget.placeData.photoUrl, 
//         placeDescription: _placeDescriptionController.text.trim(),
//         itemName: widget.placeData.itemName,
//         itemColor: widget.placeData.itemColor,
//         itemForm: widget.placeData.itemForm,
//         itemGroup: widget.placeData.itemGroup,
//         itemDescription: widget.placeData.itemDescription,
//         placePhotoUrl: _selectedImagePath ?? widget.placeData.placePhotoUrl, // Use selected image or current URL
//       );

//       final placeBox = await Hive.openBox<PlaceData>(historyBoxName);
//       await placeBox.put(widget.placeData.id.toString(), updatedPlaceData);
//       Navigator.pop(context);
//     }
//   }

//   Future<void> _selectImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImagePath = pickedFile.path;
//       });
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDateTime,
//       firstDate: DateTime(2000),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDateTime = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.placeData.itemName),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (widget.placeData.photoUrl != null) 
//                   Image.file(File(widget.placeData.photoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover), 
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _placeNameController,
//                   decoration: const InputDecoration(labelText: 'Place Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a place name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _placeDescriptionController,
//                   decoration: const InputDecoration(labelText: 'Place Description'),
//                   maxLines: 3,
//                 ),
//                 const SizedBox(height: 16.0),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: _placePhotoUrlController,
//                         decoration: const InputDecoration(labelText: 'Place Photo URL'),
//                         keyboardType: TextInputType.url,
//                       ),
//                     ),
//                     const SizedBox(width: 16.0),
//                     ElevatedButton(
//                       onPressed: _selectImage,
//                       child: const Text('Choose Image'),
//                     ),
//                   ],
//                 ),
//                 if (_selectedImagePath != null) 
//                   Image.file(File(_selectedImagePath!), height: 250, width: double.infinity, fit: BoxFit.cover),
//                 const SizedBox(height: 16.0),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         'Save Date: ${DateFormat('dd/MM/yyyy').format(_selectedDateTime)}',
//                         style: const TextStyle(fontSize: 16.0),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () => _selectDate(context),
//                       icon: const Icon(Icons.calendar_today),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 32.0),
//                 ElevatedButton(
//                   onPressed: _updatePlace,
//                   child: const Text('Update Place'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'dart:io';

// import 'package:daily_scavenger/data/models/history/history_data.dart';
// import 'package:daily_scavenger/data/models/item/item_data.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:image_picker/image_picker.dart';

// const String historyBoxName = 'places';


// class EditHistoryPage extends StatefulWidget {
//   final PlaceData historyData;

//   const EditHistoryPage({Key? key, required this.historyData, }) : super(key: key);

//   @override
//   State<EditHistoryPage> createState() => _EditHistoryPageState();
// }

// class _EditHistoryPageState extends State<EditHistoryPage> {
//   final _formKey = GlobalKey<FormState>();
//   // final _dateController = TextEditingController();
//   // final _timeController = TextEditingController();
//   final _placeNameController = TextEditingController();
//   // final _descriptionController = TextEditingController();
//   final _imagePicker = ImagePicker();
//   File? _image;
//   String? _imageUrl; 
//   late String? historyData;


//   @override
//   void initState() {
//     super.initState();
//     _placeNameController.text = widget.historyData.placeName;
//     // _timeController.text = widget.historyData.saveDateTime as String;
//     // _descriptionController.text = widget.historyData.placeDescription;
//     // _dateController.text = widget.historyData.saveDateTime as String;
//     _imageUrl = widget.historyData.placePhotoUrl;
//     historyData = widget.historyData.photoUrl!;
//   }

//   Future<void> _selectImage() async {
//     final pickedFile = await _imagePicker.pickImage(
//       source: ImageSource.gallery, // or ImageSource.camera
//     );
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//         _imageUrl = pickedFile.path;
//       });
//     }
//   }

//   Future<void> _saveChanges() async {
//     if (_formKey.currentState!.validate()) {
//       final box = await Hive.openBox<PlaceData>(historyBoxName);

//       // Update the ItemData object in Hive
//       final updatedItem = PlaceData(
//         id: widget.historyData.id, 
//         placeName: _placeNameController.text.trim(),
//         saveDateTime: DateTime.now(),
//         // placeDescription: _descriptionController.text.trim(),
//         placePhotoUrl: _imageUrl, 
//         itemName:  widget.historyData.itemName, 
       
        
//       );
//       await box.put(widget.historyData.id.toString(), updatedItem);

//       // Navigate back to the previous screen
//       Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Item'),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (historyData.photoUrl != null)
//               Image.file(File(historyData.photoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),
                
//                 TextFormField(
//                   controller: _placeNameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a name';
//                     }
//                     return null;
//                   },
//                 ),
//                 // const SizedBox(height: 16.0),
//                 // TextFormField(
//                 //   controller: _descriptionController,
//                 //   decoration: const InputDecoration(labelText: 'Form'),
//                 //   validator: (value) {
//                 //     if (value == null || value.isEmpty) {
//                 //       return 'Please enter a form';
//                 //     }
//                 //     return null;
//                 //   },
//                 // ),
//                  const SizedBox(height: 16.0),
//                 TextFormField(
//                   // controller: _dateController,
//                   decoration: const InputDecoration(labelText: 'Group'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a group';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 // TextFormField(
//                 //   controller: _descriptionController,
//                 //   decoration: const InputDecoration(labelText: 'Description'),
//                 //   validator: (value) {
//                 //     if (value == null || value.isEmpty) {
//                 //       return 'Please enter a description';
//                 //     }
//                 //     return null;
//                 //   },
//                 // ),
//                 // Image Preview (if an image is selected)
//                 if (_imageUrl != null)
//                   Image.file(File(_imageUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),
//                 // Button to choose image
//                 ElevatedButton(
//                   onPressed: _selectImage,
//                   child: const Text('Choose Image'),
//                 ),
//                 const SizedBox(height: 16.0),
//                 // Text Fields for Item Information
//                 const SizedBox(height: 32.0),
//                 ElevatedButton(
//                   onPressed: _saveChanges,
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