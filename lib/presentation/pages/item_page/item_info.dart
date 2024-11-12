import 'package:daily_scavenger/data/models/user/user_data.dart';
import 'package:daily_scavenger/presentation/pages/history_item/history_item.dart';
import 'package:daily_scavenger/presentation/pages/item_page/edit_item.dart';
import 'package:flutter/material.dart';
import 'dart:io'; 

// ... your UserData class definition ...

const String userBoxName = 'users';
// Page for displaying details of a specific user
class UserDetailPage extends StatelessWidget {
  final UserData userData;
  // final UserData userId;

  const UserDetailPage({Key? key, required this.userData, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User ${userData.id}'), // Display the user ID in the title
        
        actions: [
          ElevatedButton(
          onPressed: () {
            // Navigate to UserEditPage when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserEditPage(userData: userData),
              ),
            );
          },
          child: const Text('Edit User'),
        ),
        ],
        
      ),
      // bottomNavigationBar: Padding(
      //       padding: const EdgeInsets.symmetric(
      //         horizontal: 25,
      //         vertical: 30,
      //       ),
      //       child: DefaultButton(
      //         text: 'Add new item',
      //         onTap: () {
      //               Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => AddPlacePage(userId: userId,),
      //         ),
      //       );
      //             },
      //       ),
      //     ),
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

            Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to AddPlacePage, passing the userId
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPlacePage(userId: userData.id),
                  ),
                );
              },
              child: const Text('Add Place'),
            ),
          ),
          ],

        ),
      ),
    );
  }
}
