part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class ProductAdded extends CartEvent {
  final Product product;

  const ProductAdded(this.product);

  @override
  List<Object> get props => [product];
}

class ProductRemoved extends CartEvent {
  final Product product;

  const ProductRemoved(this.product);
  @override
  List<Object> get props => [product];
}

class CartCleared extends CartEvent {
  @override
  List<Object> get props => [];
}
