import 'package:flutter_mobx_project/data/product_model.dart';

class CartProduct {
  final Product product;
  late int count;

  CartProduct(this.product, this.count);

  factory CartProduct.clone(CartProduct source) {
    return CartProduct (
      source.product,
      source.count,
    );
  }
}

List<CartProduct> cartInit() {
  return getProducts().map((item) => CartProduct(item, 0)).toList();
}