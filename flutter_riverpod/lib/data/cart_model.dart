import 'package:flutter_riverpod_project/data/product_model.dart';

class CartProduct {
  final Product product;
  late int count;

  CartProduct(this.product, this.count);
}
