import 'package:flutter/material.dart';
import 'package:bloc_stream_controller/ui/cart_page.dart';
import 'package:bloc_stream_controller/ui/catalog_page.dart';
import 'package:go_router/go_router.dart';

import 'package:bloc_stream_controller/bloc/cart_bloc.dart';
import 'package:bloc_stream_controller/bloc/catalog_bloc.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'State Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router(),
    );
  }

  @override
  void dispose() {
    catalogBloc.dispose();
    cartBloc.dispose();
    super.dispose();
  }
}
