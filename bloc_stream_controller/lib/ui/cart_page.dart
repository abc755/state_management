import 'package:bloc_stream_controller/data/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:bloc_stream_controller/bloc/cart_bloc.dart';
import 'package:bloc_stream_controller/bloc/catalog_bloc.dart';

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
              cartBloc.onCartClear();
            },
          ),
        ],
      ),
      body: StreamBuilder<List<CartProduct>>(
          initialData: cartBloc.cart,
          stream: cartBloc.state,
          builder: (_, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!.isEmpty
              ? const Center(
                  child: Text('Ваша корзина пуста'),
                )
              : ListView(
                  children: [
                    ...snapshot.data!.map(
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
