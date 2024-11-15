part of 'my_items_bloc.dart';


abstract class MyItemsState extends Equatable {
  const MyItemsState();

  @override
  List<Object?> get props => [];
}

class MyItemsInitial extends MyItemsState {}

class MyItemsLoading extends MyItemsState {}

// class CurrentItemLoaded extends MyItemsState {
//   final ItemData currentItem;


//   const CurrentItemLoaded({required this.currentItem,});

//   @override
//   List<Object?> get props => [currentItem];
// }

class CurrentItemLoaded extends MyItemsState {
  final ItemData currentItem;

  const CurrentItemLoaded({required this.currentItem});

   @override
  List<Object?> get props => super.props..add(currentItem);
}
class MyItemsLoaded extends MyItemsState {
  final List<ItemData> items;
  


  const MyItemsLoaded({required this.items,});

  @override
  List<Object?> get props => super.props..add(items);
}

class MyItemsFailure extends MyItemsState {
  final String message;

  const MyItemsFailure({required this.message});

  @override
  List<Object> get props => [message];
}