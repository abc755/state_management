import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_project/data/cart_model.dart';
import 'package:flutter_mobx_project/data/product_model.dart';

part 'state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  @observable
  List<CartProduct> cart = cartInit();

  @action
  void addToCart(Product product) {
    final List<CartProduct> newState = cart.map((el) => CartProduct.clone(el)).toList();
    for (var i = 0; i < newState.length; i++) {
      if (newState[i].product.id == product.id) {
        newState[i].count++;
        cart = newState;
        return;
      }
    }
    newState.add(CartProduct(product, 1));
    cart = newState;
  }

  @action
  void removeFromCart(Product product) {
    final List<CartProduct> newState = cart.map((el) => CartProduct.clone(el)).toList();
    CartProduct? itemFound;
    for (var i = 0; i < newState.length; i++) {
      if (newState[i].product.id == product.id) {
        itemFound = newState[i];
        if (itemFound.count > 1) {
          newState[i].count--;
        } else {
          newState.remove(itemFound);
        }
        cart = newState;
        return;
      }
    }
  }

  @action
  void clearCart() {
    cart = cartInit();
  }
}
