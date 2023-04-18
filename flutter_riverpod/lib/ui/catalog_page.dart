import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_project/business/product_controller.dart';
import 'package:go_router/go_router.dart';

class CatalogPage extends ConsumerWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                              return Text(ref
                                  .watch(cartProvider.notifier)
                                  .getCountInCart(product)
                                  .toString());
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
