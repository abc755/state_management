// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppState, Store {
  late final _$cartAtom = Atom(name: '_AppState.cart', context: context);

  @override
  List<CartProduct> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(List<CartProduct> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  late final _$_AppStateActionController =
      ActionController(name: '_AppState', context: context);

  @override
  void addToCart(Product product) {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.addToCart');
    try {
      return super.addToCart(product);
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart(Product product) {
    final _$actionInfo = _$_AppStateActionController.startAction(
        name: '_AppState.removeFromCart');
    try {
      return super.removeFromCart(product);
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCart() {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.clearCart');
    try {
      return super.clearCart();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart}
    ''';
  }
}
