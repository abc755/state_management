import 'package:flutter_riverpod_project/data/cart_model.dart';
import 'package:flutter_riverpod_project/data/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = Provider<List<Product>>((_) {
  return getProducts();
});

final cartProvider =
    StateNotifierProvider<CartState, List<CartProduct>>((_) => CartState([]));

class CartState extends StateNotifier<List<CartProduct>> {
  CartState(super.state);

  void addToCart(Product product) {
    var newState = state;
    for (var i = 0; i < newState.length; i++) {
      if (newState[i].product.id == product.id) {
        newState[i].count++;
        state = newState;
        return;
      }
    }
    newState.add(CartProduct(product, 1));
    state = newState;
  }

  void removeFromCart(Product product) {
    var newState = state;
    CartProduct? itemFound;
    for (var i = 0; i < newState.length; i++) {
      if (newState[i].product.id == product.id) {
        itemFound = newState[i];
        if (itemFound.count > 1) {
          newState[i].count--;
        } else {
          newState.remove(itemFound);
        }
        state = newState;
        return;
      }
    }
  }

  void clearCart() {
    var newState = state;
    newState.clear();
    state = newState;
  }

  int getCountInCart(Product product) {
    CartProduct? itemFound;
    for (var i = 0; i < state.length; i++) {
      if (state[i].product.id == product.id) {
        itemFound = state[i];
        return itemFound.count;
      }
    }
    return 0;
  }

}
