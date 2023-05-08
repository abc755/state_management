import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx_project/mobx/state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Корзина'),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                state.clearCart();
              },
            ),
          ],
        ),
        body: Observer(builder: (_) {
          return state.cart.where((i) => i.count > 0).toList().isEmpty
              ? const Center(
                  child: Text('Ваша корзина пуста'),
                )
              : ListView(
                  children: [
                    ...state.cart.where((i) => i.count > 0).toList().map(
                      (item) => ListTile(
                        title: Text(item.product.name),
                        subtitle: Text("Количество в корзине ${item.count}"),
                      ),
                    ),
                  ],
                );
        }));
  }
}

// class _CartViewModel {
//   final List<CartProduct> items;
//
//   _CartViewModel(this.items);
//   static _CartViewModel fromStore(Store<AppState> store) {
//     List<CartProduct> newList = [];
//     newList = store.state.cart.where((i) => i.count > 0).toList();
//     return _CartViewModel(newList);
//   }
// }
