import 'package:bloc_stream_controller/data/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bloc_stream_controller/bloc/catalog_bloc.dart';
import 'package:bloc_stream_controller/bloc/cart_bloc.dart';
import 'package:bloc_stream_controller/data/product_model.dart';

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
      body: StreamBuilder<List<Product>>(
          initialData: catalogBloc.products,
          stream: catalogBloc.state,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  ...?snapshot.data?.map(
                    (item) => Card(
                      child: ListTile(
                        leading: Image.network(item.image),
                        title: Text(item.name),
                        trailing: SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    cartBloc.onProductRemove(item);
                                  }),
                              StreamBuilder<List<CartProduct>>(
                                  initialData: const [],
                                  stream: cartBloc.state,
                                  builder: (_, snapshotCart) {
                                    if (snapshotCart.hasData) {
                                      return Text(cartBloc
                                          .getCountInCart(item)
                                          .toString());
                                    }
                                    return Text('0');
                                  }),
                              IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    cartBloc.onProductAdd(item);
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
