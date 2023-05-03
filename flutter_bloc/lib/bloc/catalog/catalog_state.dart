part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();
}

class CatalogInitial extends CatalogState {
  @override
  List<Object> get props => [];
}
class CatalogLoaded extends CatalogState {
  const CatalogLoaded([
    this.products = const [],
  ]);

  final List<Product> products;

  @override
  List<Object> get props => [products];
}