// import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';

import 'package:daily_scavenger/bloc/product/item_bloc.dart';
import 'package:daily_scavenger/data/models/user/user_data.dart';
import 'package:daily_scavenger/data/services/image_service.dart';
import 'package:daily_scavenger/presentation/pages/item_page/item_page.dart';
import 'package:daily_scavenger/presentation/utils/app_colors.dart';
import 'package:daily_scavenger/presentation/utils/app_fonts.dart';
import 'package:daily_scavenger/presentation/utils/app_router.dart';
import 'package:daily_scavenger/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:nectar/src/bloc/product/product_bloc.dart';

// import 'package:nectar/src/data/models/order_product.dart';
// import 'package:nectar/src/data/repositories/product_repository.dart';
// import 'package:nectar/src/presentation/utils/app_colors.dart';
// import 'package:nectar/src/presentation/utils/helpers.dart';
// import 'package:nectar/src/presentation/widgets/buttons/default_button.dart';
// import 'package:nectar/src/presentation/widgets/buttons/round_button.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});
class MyItemsPage extends StatefulWidget {
  const MyItemsPage({super.key});

  @override
  State<MyItemsPage> createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
  bool ignoring = false;
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  final _imageService = ImageService();
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  List<String> _imagePaths = []; // To store retrieved image paths

  Future<void> _getImageFromSource(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    setState(() {
      _selectedImage = pickedImage;
    });

    if (_selectedImage != null) {
      // Save the image path
      await _imageService.saveImagePath(_selectedImage!.path);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchImages(); // Call the function to retrieve images when the screen loads
  }

  Future<void> _fetchImages() async {
    final imagePaths = await _imageService.getAllImagePaths();
    setState(() {
      _imagePaths = imagePaths;
    });
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
              ValueListenableBuilder(
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
            ],
          ),
        );
      },
    );
  }
}
