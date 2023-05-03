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

  //Переделать
  int getCountInCart(product) {
    CartProduct? itemFound;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].product.id == product.id) {
        itemFound = cart[i];
        print('count ${itemFound.count}');
        return itemFound.count;
      }
    }
    print('count 0');
    return 0;
  }

}