import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/redux/reducers.dart';
import 'package:flutter_redux_project/redux/store.dart';
import 'package:flutter_redux_project/ui/cart_page.dart';
import 'package:flutter_redux_project/ui/catalog_page.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(
      appReducers,
      initialState: AppState.initial(),
  );
  runApp(MyApp(store));
}

GoRouter router(Store<AppState> store) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/catalog',
        builder: (context, state) => CatalogPage(store: store),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => CartPage(store: store),
          ),
        ],
      ),
    ],
    initialLocation: '/catalog',
  );
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp.router(
        title: 'State Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router(store),
      ),
    );
  }
}
