// part of 'item_bloc.dart';

// abstract class ItemState extends Equatable {
//   const ItemState();

//   @override
//   List<Object> get props => [];
// }

// class ItemInitial extends ItemState {}

// class ItemCartUpdated extends ItemState {
//   final OrderProduct item;
//   final num quantity;

//   const ItemCartUpdated({
//     required this.item,
//     required this.quantity,
//   });

//   @override
//   List<Object> get props => [item, quantity];
// }

// class ProductFavoriteUpdated extends ItemState {
//   final Product product;
//   final bool isFavorite;

//   const ProductFavoriteUpdated({
//     required this.product,
//     required this.isFavorite,
//   });

//   @override
//   List<Object> get props => [product, isFavorite];
// }

// class ProductError extends ItemState {
//   final String message;

//   const ProductError({
//     required this.message,
//   });

//   @override
//   List<Object> get props => [message];
// }
