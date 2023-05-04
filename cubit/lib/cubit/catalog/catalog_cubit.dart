import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cubit/data/product_model.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit() : super(CatalogInitial(products: getProducts()));
}
