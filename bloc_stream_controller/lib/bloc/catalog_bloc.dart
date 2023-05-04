import 'dart:async';

import 'package:bloc_stream_controller/data/product_model.dart';

class CatalogBloc {
  List<Product> products = getProducts();

  final _stateController = StreamController<List<Product>>.broadcast();

  Stream<List<Product>> get state => _stateController.stream.asBroadcastStream();

  void dispose() {
    _stateController.close();
  }
}
final CatalogBloc catalogBloc = CatalogBloc();