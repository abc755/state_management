import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/data/cart_model.dart';
import 'package:flutter_redux_project/redux/store.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_project/redux/actions.dart';

class CartPage extends StatelessWidget {
  final Store<AppState> store;

  const CartPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Корзина'),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                store.dispatch(CartClearAction());
              },
            ),
          ],
        ),
        body: StoreConnector<AppState, _CartViewModel>(
            converter: (store) => _CartViewModel.fromStore(store),
            builder: (context, cart) {
              return cart.items.isEmpty
                  ? const Center(
                      child: Text('Ваша корзина пуста'),
                    )
                  : ListView(
                      children: [
                        ...cart.items.map(
                          (item) => ListTile(
                            title: Text(item.product.name),
                            subtitle:
                                Text("Количество в корзине ${item.count}"),
                          ),
                        ),
                      ],
                    );
            }));
  }
}

class _CartViewModel {
  final List<CartProduct> items;

  _CartViewModel(this.items);
  static _CartViewModel fromStore(Store<AppState> store) {
    List<CartProduct> newList = [];
    newList = store.state.cart.where((i) => i.count > 0).toList();
    return _CartViewModel(newList);
  }
}