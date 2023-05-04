import 'package:hooks_riverpod_project/data/product_model.dart';

class CartProduct {
  final Product product;
  late int count;

  CartProduct(this.product, this.count);

  factory CartProduct.clone(CartProduct source) {
    return CartProduct(
      source.product,
      source.count,
    );
  }
}
