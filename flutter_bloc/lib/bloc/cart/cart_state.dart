part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  const CartLoaded([
    this.cart = const [],
  ]);

  final List<CartProduct> cart;

  @override
  List<Object> get props => [cart];

}