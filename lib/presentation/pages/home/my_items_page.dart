import 'dart:io';

import 'package:daily_scavenger/bloc/product/item_bloc.dart';
import 'package:daily_scavenger/data/models/user/user_data.dart';
import 'package:daily_scavenger/presentation/pages/item_page/item_info.dart';
// import 'package:daily_scavenger/presentation/pages/item_page/item_page.dart';
import 'package:daily_scavenger/presentation/utils/app_colors.dart';
import 'package:daily_scavenger/presentation/utils/app_fonts.dart';
import 'package:daily_scavenger/presentation/utils/app_router.dart';
import 'package:daily_scavenger/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';


const String userBoxName = 'users';
class MyItemsPage extends StatefulWidget {
  const MyItemsPage({super.key});

  @override
  State<MyItemsPage> createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
  bool ignoring = false;
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];



  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: DefaultButton(
              text: 'Add new item',
              onTap: () {
                    // navigate to orders page
                    Navigator.of(context).pushNamed(AppRouter.addItemRoute);
                  },
            ),
          ),
          body: Column(
            children: [
              // const SizedBox(
              //   height: 25,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'My items',
                    style: AppFonts.h10,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFF6CB1FF),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () {
                       
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: AppColors.gray,
                          style: BorderStyle.solid,
                          width: 1),
                    ),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(15),
                      items: _dropdownValues
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      isExpanded: false,
                      value: _dropdownValues.first,
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 200),
              SizedBox(
                height: 450,
                child: ValueListenableBuilder(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
