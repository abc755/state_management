import 'package:flutter/material.dart';
import '../business/product_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<CartState>().clearCart();
            },
          ),
        ],
      ),
      body: context.watch<CartState>().cart.isEmpty
          ? const Center(
              child: Text('Ваша корзина пуста'),
            )
          : ListView(
              children: [
                ...context.watch<CartState>().cart.map(
                      (item) => ListTile(
                        title: Text(item.product.name),
                        subtitle: Text("Количество в корзине ${item.count}"),
                      ),
                    ),
              ],
            ),
    );
  }
}
