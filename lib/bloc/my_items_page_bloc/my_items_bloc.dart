import 'package:bloc/bloc.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/data/services/item_service.dart';
import 'package:daily_scavenger/main.dart';
import 'package:daily_scavenger/presentation/utils/app_router.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


part 'my_items_event.dart';
part 'my_items_state.dart';

  late Box<ItemData> itemBox;

class MyItemsBloc extends Bloc<MyItemsEvent, MyItemsState> {
  MyItemsBloc() : super(MyItemsInitial()) {
    itemBox = Hive.box<ItemData>('myBox'); 
    final itemService = ItemService(itemBox);
    on<FetchMyItemsPageData>((event, emit) async {
      emit(MyItemsLoading());
      try {
        final myItemsList = await itemService.getItems();
            emit(
          MyItemsLoaded(
            items: myItemsList,
           
          ),
        );
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        emit(MyItemsFailure(message: e.toString()));
      }
    });
    on<MyItemsLoadEvent>(_onLoadItems);
    on<MyItemsNavigateToAddItemEvent>(_onNavigateToAddItem);
    on<MyItemsNavigateToDetailEvent>(_onNavigateToDetail); 
  }
}
  void _onLoadItems(MyItemsLoadEvent event, Emitter<MyItemsState> emit) async {
    emit(MyItemsLoading());
    
    try {
      final items = itemBox.values.toList();
      emit(MyItemsLoaded(items: items, ));
    } catch (e) {
      emit(MyItemsFailure(message: e.toString()));
    }
  }
  


  void _onNavigateToAddItem(
      MyItemsNavigateToAddItemEvent event, Emitter<MyItemsState> emit) {
    // Use Navigator.pushNamed to navigate to the add item route
    Navigator.pushNamed(event.context, AppRouter.addItemRoute); 
  }

  void _onNavigateToDetail(
  MyItemsNavigateToDetailEvent event, 
  Emitter<MyItemsState> emit
) {
  // Use Navigator.pushNamed to navigate to the add item route
  Navigator.pushNamed(
    event.context, 
    AppRouter.itemDetailRoute, // Assuming you have a route defined in AppRouter
    arguments: event.itemData, // Pass itemData as an argument
  );
}
