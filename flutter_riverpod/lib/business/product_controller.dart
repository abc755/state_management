import 'package:flutter_riverpod_project/data/cart_model.dart';
import 'package:flutter_riverpod_project/data/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = Provider<List<Product>>((_) {
  return getProducts();
});

final cartProvider =
    StateNotifierProvider<CartState, List<CartProduct>>((ref) => CartState());

class CartState extends StateNotifier<List<CartProduct>> {
  CartState() : super([]);

  void addToCart(Product product) {
    final List<CartProduct> newState = state.map((el) => CartProduct.clone(el)).toList();
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
    final List<CartProduct> newState = state.map((el) => CartProduct.clone(el)).toList();
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
    final newState = <CartProduct>[];
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
