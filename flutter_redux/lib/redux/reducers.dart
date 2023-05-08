import 'package:flutter_redux_project/data/cart_model.dart';
import 'package:flutter_redux_project/redux/actions.dart';
import 'package:flutter_redux_project/redux/store.dart';

AppState appReducers(AppState state, dynamic action) {
  if (action is ProductAddAction) {
    return state.copyWith(cart: addItem(state.cart, action));
  } else if (action is ProductRemoveAction) {
    return state.copyWith(cart: removeItem(state.cart, action));
  } else if (action is CartClearAction) {
    return state.copyWith(cart: clearCart(state.cart, action));
  }
  return state;
}

List<CartProduct> addItem(List<CartProduct> cart, ProductAddAction action) {
  final List<CartProduct> newItems =
      cart.map((el) => CartProduct.clone(el)).toList();
  for (var i = 0; i < newItems.length; i++) {
    if (newItems[i].product.id == action.item.id) {
      newItems[i].count++;
      return newItems;
    }
  }
  newItems.add(CartProduct(action.item, 1));
  return newItems;
}

List<CartProduct> removeItem(
    List<CartProduct> cart, ProductRemoveAction action) {
  final List<CartProduct> newItems =
      cart.map((el) => CartProduct.clone(el)).toList();
  CartProduct? itemFound;
  for (var i = 0; i < newItems.length; i++) {
    if (newItems[i].product.id == action.item.id) {
      itemFound = newItems[i];
      if (itemFound.count > 0) {
        newItems[i].count--;
      }
      break;
    }
  }
  return newItems;
}

List<CartProduct> clearCart(_, __) {
  return cartInit();
}
