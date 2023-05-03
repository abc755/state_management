import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/bloc/cart/cart_bloc.dart';
import 'package:flutter_bloc_project/bloc/catalog/catalog_bloc.dart';
import 'package:flutter_bloc_project/ui/cart_page.dart';
import 'package:flutter_bloc_project/ui/catalog_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const CatalogPage(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => const CartPage(),
          ),
        ],
      ),
    ],
    initialLocation: '/catalog',
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CatalogBloc>(
            create: (_) => CatalogBloc()..add(CatalogStarted())),
        BlocProvider<CartBloc>(create: (_) => CartBloc()..add(CartStarted())),
      ],
      child: MaterialApp.router(
        title: 'State Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router(),
      ),
    );
  }
}
