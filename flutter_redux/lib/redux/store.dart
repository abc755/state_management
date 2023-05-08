import 'package:flutter/material.dart';
import 'package:flutter_redux_project/data/cart_model.dart';

@immutable
class AppState {
  final List<CartProduct> cart;

  const AppState({this.cart = const []});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState &&
        other.cart == cart;
  }

  @override
  int get hashCode {
    return cart.hashCode;
  }

  AppState copyWith({
    List<CartProduct>? cart,
  }) {
    return AppState(cart: cart ?? this.cart);
  }

  factory AppState.initial() => AppState(cart: cartInit());
}
