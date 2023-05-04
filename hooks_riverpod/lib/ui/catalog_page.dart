import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_project/business/product_controller.dart';

class CatalogPage extends HookConsumerWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    int getCount(id) {
      for (var i = 0; i < cart.length; i++) {
        if (cart[i].product.id == id) {
          return cart[i].count;
        }
      }
      return 0;
    }

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
          ...ref.watch(productsProvider).map(
                (product) => Card(
              child: ListTile(
                leading: Image.network(product.image),
                title: Text(product.name),
                trailing: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            ref
                                .read(cartProvider.notifier)
                                .removeFromCart(product);
                          }),
                      Consumer(
                        builder: (context, ref, child) {
                          return Text(getCount(product.id).toString());
                        },
                      ),
                      IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            ref
                                .read(cartProvider.notifier)
                                .addToCart(product);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
