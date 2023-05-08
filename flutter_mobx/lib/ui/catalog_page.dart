import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx_project/mobx/state.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

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
            ...state.cart.mapIndexed(
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
                                state.removeFromCart(item.product);
                              }),
                          Observer(builder: (_) {
                            return Text(state.cart[index].count.toString());
                          }),
                          IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                state.addToCart(item.product);
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
