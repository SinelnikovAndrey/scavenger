part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

// update cart
class UpdateCart extends ItemEvent {
  final OrderProduct orderProduct;
  final num quantity;

  const UpdateCart({
    required this.orderProduct,
    required this.quantity,
  });

  @override
  List<Object> get props => [orderProduct, quantity];
}

// update favorite
class UpdateFavorite extends ItemEvent {
  final Product product;
  final bool isFavorite;

  const UpdateFavorite({
    required this.product,
    required this.isFavorite,
  });

  @override
  List<Object> get props => [product, isFavorite];
}
