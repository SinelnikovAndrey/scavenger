

import 'package:daily_scavenger/bloc/product/item_bloc.dart';
import 'package:daily_scavenger/data/models/history/history_data.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/data/services/hive_adapters.dart';
import 'package:daily_scavenger/my_app.dart';
import 'package:daily_scavenger/presentation/pages/history_item/add_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  
 WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<ItemData>('items');
  await Hive.openBox<PlaceData>('places');
  await Hive.openBox('userBox');
  await Hive.box<ItemData>(itemBoxName); 
  // registerAdapters();
  // Hive.registerAdapter(ImageDataAdapter()); 
  // await Hive.initFlutter();
  
  Hive.registerAdapter(ItemDataAdapter());
  Hive.registerAdapter(PlaceDataAdapter());
  // await Hive.openBox('myBox');
  // await Hive.openBox('categoryBox');
  // await Hive.openBox('images');

  // ProductRepository.loadCart();

  runApp(
    MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => LoginBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => RegisterBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => ForgotPasswordBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => RegisterPhoneBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => AccountBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => ShopBloc(),
        // ),
        BlocProvider(
          create: (context) => ItemBloc(),
        ),
        // BlocProvider(
        //   create: (context) => FavoritesBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => ExploreBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => CategoryProductsBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => SearchBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => StoreDetailsBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => StoresBloc(),
        // ),
      ],
      child: const MyApp(),
    ),
  );
}
