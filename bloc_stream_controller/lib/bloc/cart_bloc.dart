import 'dart:async';

import 'package:bloc_stream_controller/data/product_model.dart';
import 'package:bloc_stream_controller/data/cart_model.dart';

class CartBloc {
  List<CartProduct> cart = [];

  final _stateController = StreamController<List<CartProduct>>.broadcast();

  Stream<List<CartProduct>> get state => _stateController.stream.asBroadcastStream();

  void dispose() {
    _stateController.close();
  }

  void onProductAdd(Product product) {
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].product.id == product.id) {
        cart[i].count++;
        _stateController.add(cart);
        return;
      }
    }
    cart.add(CartProduct(product, 1));
    _stateController.add(cart);
  }

  void onProductRemove(Product product) {
    CartProduct? itemFound;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].product.id == product.id) {
        itemFound = cart[i];
        if (itemFound.count > 1) {
          cart[i].count--;
        } else {
          cart.remove(itemFound);
        }
        _stateController.add(cart);
        return;
      }
    }
  }

  void onCartClear() {
    cart.clear();
    _stateController.add(cart);
  }

  int getCountInCart(product) {
    CartProduct? itemFound;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].product.id == product.id) {
        itemFound = cart[i];
        return itemFound.count;
      }
    }
    return 0;
  }
}

final CartBloc cartBloc = CartBloc();
