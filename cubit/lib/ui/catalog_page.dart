import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cubit/cubit/cart/cart_cubit.dart';
import 'package:cubit/cubit/catalog/catalog_cubit.dart';

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
        body: BlocBuilder<CatalogCubit, CatalogState>(builder: (context, state) {
          if (state is CatalogInitial) {
            return ListView(
              children: [
                ...state.products.map(
                  (item) => Card(
                    child: ListTile(
                      leading: Image.network(item.image),
                      title: Text(item.name),
                      trailing: SizedBox(
                        width: 120,
                        child: BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            if (state is CartInitial) {
                              return Row(
                                children: [
                                  IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        context
                                            .read<CartCubit>()
                                            .onProductRemove(item);
                                      }),
                                  Text(context
                                      .read<CartCubit>()
                                      .getCountInCart(item)
                                      .toString()),
                                  IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        context
                                            .read<CartCubit>()
                                            .onProductAdd(item);
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
