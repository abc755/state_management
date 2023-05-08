import 'package:flutter_redux_project/data/cart_model.dart';
import 'package:flutter_redux_project/data/product_model.dart';

class ProductAddAction {
  final Product item;

  ProductAddAction(this.item);
}

class ProductRemoveAction {
  final Product item;

  ProductRemoveAction(this.item);
}

class CartClearAction {
  CartClearAction();
}