part of 'my_items_bloc.dart';


abstract class MyItemsEvent extends Equatable {
const MyItemsEvent();
   @override
  List<Object?> get props => [];
}

class FetchMyItemsPageData extends MyItemsEvent {
  @override
  List<Object?> get props => [];
}

class MyItemsLoadEvent extends MyItemsEvent {}
class LoadCurrentItemEvent extends MyItemsEvent {
  final String itemId;

  const LoadCurrentItemEvent({required this.itemId});
}


class MyItemsNavigateToAddItemEvent extends MyItemsEvent {
  final BuildContext context;

  const MyItemsNavigateToAddItemEvent(this.context); 

  @override
  List<Object?> get props => [context]; 
}
class MyItemsNavigateToDetailEvent extends MyItemsEvent {
  final BuildContext context;
  final ItemData itemData; 

  const MyItemsNavigateToDetailEvent(this.context, this.itemData);

  @override
  List<Object?> get props => [context, itemData];
}

