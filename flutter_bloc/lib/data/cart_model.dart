import 'package:flutter_bloc_project/data/product_model.dart';

class CartProduct {
  final Product product;
  late int count;

  CartProduct(this.product, this.count);
}
