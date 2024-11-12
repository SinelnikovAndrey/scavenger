import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:math';
// import 'package:intl/intl.dart'; // Import for formatting date and time




// Define a box name for Hive
const String userBoxName = 'users';
const String placeBoxName = 'places';

// Generate a random ID for places
int _generateId() {
  final random = Random();
  return random.nextInt(1000000);
}


// Page for adding place data
class AddPlacePage extends StatefulWidget {
  final int userId; // User ID for associating with place data

  const AddPlacePage({Key? key, required this.userId}) : super(key: key);

  @override
  State<AddPlacePage> createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final _formKey = GlobalKey<FormState>();
  final _placeNameController = TextEditingController();

  Future<void> _savePlace() async {
    if (_formKey.currentState!.validate()) {
      final placeId = _generateId(); // Generate a unique ID for the place
      final placeData = PlaceData(
        id: placeId,
        placeName: _placeNameController.text.trim(),
        saveDateTime: DateTime.now(),
      );

      final placeBox = await Hive.openBox<PlaceData>(placeBoxName);
      await placeBox.put(placeId.toString(), placeData);

      // Optionally, you can associate this place data with a user in the Hive database.
      // For example, you could create a list of place IDs in the user's data.
      // ...

      // Navigate back to the previous screen
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
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

// ... your UserDataAdapter and PlaceDataAdapter classes (same as before) ...

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   Hive.registerAdapter(UserDataAdapter());
//   Hive.registerAdapter(PlaceDataAdapter());
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const UserDisplayPage(),
//     );
//   }
// }