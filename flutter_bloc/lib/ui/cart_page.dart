import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/bloc/cart/cart_bloc.dart';

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
              context.read<CartBloc>().add(CartCleared());
            },
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoaded) {
          return state.cart.isEmpty
              ? const Center(
                  child: Text('Ваша корзина пуста'),
                )
              : ListView(
                  children: [
                    ...state.cart.map(
                      (item) => ListTile(
                        title: Text(item.product.name),
                        subtitle: Text("Количество в корзине ${item.count}"),
                      ),
                    ),
                  ],
                );
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
