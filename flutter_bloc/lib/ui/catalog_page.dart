import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_project/bloc/cart/cart_bloc.dart';
import 'package:flutter_bloc_project/bloc/catalog/catalog_bloc.dart';

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
        body: BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
          if (state is CatalogLoaded) {
            return ListView(
              children: [
                ...state.products.map(
                  (item) => Card(
                    child: ListTile(
                      leading: Image.network(item.image),
                      title: Text(item.name),
                      trailing: SizedBox(
                        width: 120,
                        child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (state is CartLoaded) {
                              return Row(
                                children: [
                                  IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        context
                                            .read<CartBloc>()
                                            .add(ProductRemoved(item));
                                      }),
                                  Text(context
                                      .read<CartBloc>()
                                      .getCountInCart(item)
                                      .toString()),
                                  IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        context
                                            .read<CartBloc>()
                                            .add(ProductAdded(item));
                                      }),
                                ],
                              );
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        }));
  }
}
