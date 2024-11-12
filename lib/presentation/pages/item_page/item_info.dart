import 'package:daily_scavenger/data/models/user/user_data.dart';
import 'package:daily_scavenger/data/services/hive_adapters.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io'; 

// ... your UserData class definition ...

const String userBoxName = 'users';

class UserDisplayPage extends StatefulWidget {
  const UserDisplayPage({Key? key}) : super(key: key);

  @override
  State<UserDisplayPage> createState() => _UserDisplayPageState();
}

class _UserDisplayPageState extends State<UserDisplayPage> {
  late Box<UserData> usersBox; 

  @override
  void initState() {
    super.initState();
    Hive.initFlutter();
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserDataAdapter());
    }
    usersBox = Hive.box<UserData>('users');
  }

  @override
  void dispose() {
    usersBox.close();
    super.dispose();
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
          final users = box.values.toList();

          if (users.isEmpty) {
            return const Center(child: Text('No user data found'));
          } else {
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final userData = users[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the UserDetailPage when the card is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailPage(userData: userData), // Pass userData
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text('User ${userData.id}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (userData.photoUrl != null)
                            Image.file(File(userData.photoUrl!), height: 50, width: 50, fit: BoxFit.cover),
                          Text('Display Name: ${userData.displayName}'),
                          Text('Email: ${userData.email}'),
                          Text('Phone Number: ${userData.phoneNumber}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

// Page for displaying details of a specific user
class UserDetailPage extends StatelessWidget {
  final UserData userData;

  const UserDetailPage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User ${userData.id}'), // Display the user ID in the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (userData.photoUrl != null)
              Image.file(File(userData.photoUrl!), height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16.0),
            Text('Display Name: ${userData.displayName}'),
            const SizedBox(height: 16.0),
            Text('Email: ${userData.email}'),
            const SizedBox(height: 16.0),
            Text('Phone Number: ${userData.phoneNumber}'),
          ],
        ),
      ),
    );
  }
}
