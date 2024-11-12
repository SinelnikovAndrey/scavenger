import 'package:bloc/bloc.dart';
import 'package:daily_scavenger/data/models/order_product.dart';
import 'package:daily_scavenger/data/models/product.dart';
import 'package:daily_scavenger/data/repositories/item_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository _productRepository = ItemRepository();
  ItemBloc() : super(ItemInitial()) {
    on<UpdateCart>((event, emit) async {
      try {
        emit(ItemInitial());
        await _productRepository.updateCart(
          event.orderProduct,
          event.quantity,
        );
        emit(
          ItemCartUpdated(
            item: event.orderProduct,
            quantity: event.quantity,
          ),
        );
      } catch (e, s) {
        debugPrintStack(label: e.toString(), stackTrace: s);
        emit(ProductError(message: e.toString()));
      }
    });
    // on<UpdateFavorite>((event, emit) async {
    //   try {
    //     emit(ItemInitial());
    //     await _productRepository.updateFavorite(
    //       event.product,
    //       event.isFavorite,
    //     );
    //     emit(
    //       ProductFavoriteUpdated(
    //         product: event.product,
    //         isFavorite: event.isFavorite,
    //       ),
    //     );
    //   } catch (e, s) {
    //     debugPrintStack(label: e.toString(), stackTrace: s);
    //     emit(ProductError(message: e.toString()));
    //   }
    // });
  }
}
