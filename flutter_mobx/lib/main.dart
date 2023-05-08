import 'package:flutter/material.dart';
import 'package:flutter_mobx_project/mobx/state.dart';
import 'package:flutter_mobx_project/ui/cart_page.dart';
import 'package:flutter_mobx_project/ui/catalog_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/catalog',
        builder: (context, state) => CatalogPage(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => CartPage(),
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
    return Provider(
      create: (context) => AppState(),
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
