import 'dart:io';


import 'package:daily_scavenger/data/models/user/user_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


// Define a box name for Hive
const String userBoxName = 'users';

class UserDisplayPage extends StatefulWidget {
  const UserDisplayPage({Key? key}) : super(key: key);

  @override
  State<UserDisplayPage> createState() => _UserDisplayPageState();
}

class _UserDisplayPageState extends State<UserDisplayPage> {
  @override
  void initState() {
    super.initState();
    // Initialize Hive
    // Hive.initFlutter();
    // Hive.registerAdapter(UserDataAdapter());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<UserData>(userBoxName).listenable(),
        builder: (context, Box<UserData> box, widget) {
           final userData = box.get('currentUser'); // Get the user data

          if (userData == null) {
            return const Center(child: Text('No user data found'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display the user's profile image
                  if (userData.photoUrl != null)
                    Image.file(File(userData.photoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),

                  // Display the user's information
                  Text('Display Name: ${userData.displayName}'),
                  const SizedBox(height: 16.0),
                  Text('Email: ${userData.email}'),
                  const SizedBox(height: 16.0),
                  Text('Phone Number: ${userData.phoneNumber}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

