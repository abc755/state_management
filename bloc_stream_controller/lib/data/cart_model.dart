import 'package:simple_state_management/data/product_model.dart';

class CartProduct {
  final Product product;
  late int count;

  CartProduct(this.product, this.count);
}
