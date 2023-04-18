import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/business/product_controller.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

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
          ...context.watch<CartState>().products.map(
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
                                context
                                    .read<CartState>()
                                    .removeFromCart(product);
                              }),
                          Consumer<CartState>(
                            builder: (context, state, child) => Text(
                              state.getCountInCart(product).toString(),
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                context.read<CartState>().addToCart(product);
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
