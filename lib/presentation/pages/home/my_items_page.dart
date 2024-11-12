import 'dart:io';

import 'package:daily_scavenger/bloc/product/item_bloc.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/presentation/pages/item_page/item_detail.dart';
// import 'package:daily_scavenger/presentation/pages/item_page/item_page.dart';
import 'package:daily_scavenger/presentation/utils/app_colors.dart';
import 'package:daily_scavenger/presentation/utils/app_fonts.dart';
import 'package:daily_scavenger/presentation/utils/app_router.dart';
import 'package:daily_scavenger/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';


const String itemBoxName = 'items';
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
        valueListenable: Hive.box<ItemData>(itemBoxName).listenable(),
        builder: (context, Box<ItemData> box, widget) {
          final items = box.values.toList();

          if (items.isEmpty) {
            return const Center(child: Text('Your items will be here'));
          } else {
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final itemData = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailPage(itemData: itemData), 
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      // title: Text('Item ${itemData.id}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (itemData.photoUrl != null)
                            Image.file(File(itemData.photoUrl!), height: 50, width: 50, fit: BoxFit.cover),
                          Text('Name: ${itemData.name}'),
                          Text('Form: ${itemData.form}'),
                          Text('Description: ${itemData.description}'),
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
