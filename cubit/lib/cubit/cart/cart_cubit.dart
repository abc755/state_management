import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cubit/data/cart_model.dart';

import 'package:cubit/data/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartInitial(cart: []));

  void onProductAdd(Product product){
    final state = this.state;
    if (state is CartInitial) {
      final List<CartProduct> newItems = state.cart.map((el) => CartProduct.clone(el)).toList();
      for (var i = 0; i < newItems.length; i++) {
        if (newItems[i].product.id == product.id) {
          newItems[i].count++;
          emit(CartInitial(cart: newItems));
          return;
        }
      }
      newItems.add(CartProduct(product, 1));
      emit(CartInitial(cart: newItems));
    }
  }
  void onProductRemove(Product product) {
    final state = this.state;
    if (state is CartInitial) {
      final List<CartProduct> newItems = state.cart.map((el) => CartProduct.clone(el)).toList();
      CartProduct? itemFound;
      for (var i = 0; i < newItems.length; i++) {
        if (newItems[i].product.id == product.id) {
          itemFound = newItems[i];
          if (itemFound.count > 1) {
            newItems[i].count--;
          } else {
            newItems.remove(itemFound);
          }
          emit(CartInitial(cart: newItems));
          return;
        }
      }
    }
  }
  void onCartClear() {
    emit(const CartInitial(cart: []));
  }

  int getCountInCart(product) {
    CartProduct? itemFound;
    final state = this.state;
    if (state is CartInitial) {
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
