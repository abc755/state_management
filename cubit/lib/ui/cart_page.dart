import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit/cubit/cart/cart_cubit.dart';

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
              context.read<CartCubit>().onCartClear();
            },
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
        if (state is CartInitial) {
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
