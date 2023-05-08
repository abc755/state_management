import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/redux/actions.dart';
import 'package:flutter_redux_project/redux/store.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'package:collection/collection.dart';

class CatalogPage extends StatelessWidget {
  final Store<AppState> store;

  const CatalogPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Каталог'),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => context.go('/catalog/cart'),
            ),
          ],
        ),
        body: ListView(
          children: [
            ...store.state.cart.mapIndexed(
              (index, item) => Card(
                child: ListTile(
                  leading: Image.network(item.product.image),
                  title: Text(item.product.name),
                  trailing: SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                store.dispatch(
                                    ProductRemoveAction(item.product));
                              }),
                          StoreConnector<AppState, int>(
                              converter: (store) =>
                                  store.state.cart[index].count,
                              builder: (context, count) {
                                return Text(count.toString());
                              }),
                          IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                store.dispatch(ProductAddAction(item.product));
                              })
                        ],
                      )),
                ),
              ),
            )
          ],
        ));
  }
}
