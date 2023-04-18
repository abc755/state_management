import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/business/product_controller.dart';
import 'package:simple_state_management/ui/cart_page.dart';
import 'package:simple_state_management/ui/catalog_page.dart';
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
    return ChangeNotifierProvider(
      create: (_) => CartState(),
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
