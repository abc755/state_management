import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_project/business/product_controller.dart';

class CartPage extends HookConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref.read(cartProvider.notifier).clearCart();
            },
          ),
        ],
      ),
      body: ref.watch(cartProvider).isEmpty
          ? const Center(
        child: Text('Ваша корзина пуста'),
      )
          : ListView(
        children: [
          ...ref.watch(cartProvider).map(
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
