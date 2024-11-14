
import 'package:daily_scavenger/bloc/my_items_page_bloc/my_items_bloc.dart';
import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/data/services/hive_adapters.dart';
import 'package:daily_scavenger/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart'; // Import Provider

// const String itemsBoxName = 'itemBox';
const String placeBoxName = 'places';
const String itemBoxName = 'myBox';
// final itemBox = Hive.box<ItemData>('itemBox'); // Assuming you have opened the box
// final itemService = ItemService(itemBox); 


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  registerAdapters();
  // await Hive.openBox<ItemData>(itemsBoxName);
  await Hive.openBox<HistoryData>(placeBoxName);
  await Hive.openBox<ItemData>(itemBoxName);

  // ItemService.loadItems();

  runApp(
    MultiProvider(
      providers: [
        // Provider.value(value: Hive.box<ItemData>(itemBoxName)), 
        Provider.value(value: Hive.box<HistoryData>(placeBoxName)), 
        Provider.value(value: Hive.box<ItemData>(itemBoxName)), 
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  MyItemsBloc(),
            ),
        //     BlocProvider(
        //   create: (context) => ItemBloc(),
        // ),
         
          ],
          child: const MyApp(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}