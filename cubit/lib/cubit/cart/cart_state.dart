part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  const CartInitial({
    required this.cart,
  });

  final List<CartProduct> cart;

  @override
  List<Object> get props => [cart];
}

class CartLoading extends CartState {}
