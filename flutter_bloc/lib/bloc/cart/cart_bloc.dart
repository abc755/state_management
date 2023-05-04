import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_project/data/cart_model.dart';
import 'package:flutter_bloc_project/data/product_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartStarted>((event, emit) {
      emit(const CartLoaded());
    });
    on<ProductAdded>((event, emit) {
      final state = this.state;
      if (state is CartLoaded) {
        final List<CartProduct> newItems = state.cart.map((el) => CartProduct.clone(el)).toList();
        for (var i = 0; i < newItems.length; i++) {
          if (newItems[i].product.id == event.product.id) {
            newItems[i].count++;
            emit(CartLoaded(newItems));
            return;
          }
        }
        newItems.add(CartProduct(event.product, 1));
        emit(CartLoaded(newItems));
      }
    });
    on<ProductRemoved>((event, emit) {
      final state = this.state;
      if (state is CartLoaded) {
        final List<CartProduct> newItems = state.cart.map((el) => CartProduct.clone(el)).toList();
        CartProduct? itemFound;
        for (var i = 0; i < newItems.length; i++) {
          if (newItems[i].product.id == event.product.id) {
            itemFound = newItems[i];
            if (itemFound.count > 1) {
              newItems[i].count--;
            } else {
              newItems.remove(itemFound);
            }
            emit(CartLoaded(newItems));
            return;
          }
        }
      }
    });
    on<CartCleared>((event, emit) {
      emit(const CartLoaded());
    });
  }

  int getCountInCart(product) {
    CartProduct? itemFound;
    final state = this.state;
    if (state is CartLoaded) {
      for (var i = 0; i < state.cart.length; i++) {
        if (state.cart[i].product.id == product.id) {
          itemFound = state.cart[i];
          return itemFound.count;
        }
      }
      return 0;
    } else {
      return 0;
    }
  }
}
