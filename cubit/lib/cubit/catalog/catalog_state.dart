part of 'catalog_cubit.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();
}

class CatalogInitial extends CatalogState {
  const CatalogInitial({
    required this.products,
  });

  final List<Product> products;

  @override
  List<Object> get props => [products];
}
