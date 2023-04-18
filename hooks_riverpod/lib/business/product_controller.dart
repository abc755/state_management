import 'package:flutter/material.dart';
import 'package:simple_state_management/data/cart_model.dart';
import 'package:simple_state_management/data/product_model.dart';

class CartState with ChangeNotifier {
  List<Product> products = getProducts();
  List<CartProduct> cart = [];

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

  void addToCart(Product product) {
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].product.id == product.id) {
        cart[i].count++;
        notifyListeners();
        return;
      }
    }
    cart.add(CartProduct(product, 1));
    notifyListeners();
  }

  void removeFromCart(Product product) {
    CartProduct? itemFound;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].product.id == product.id) {
        itemFound = cart[i];
        if (itemFound.count > 1) {
          cart[i].count--;
        } else {
          cart.remove(itemFound);
        }
        notifyListeners();
        return;
      }
    }
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
