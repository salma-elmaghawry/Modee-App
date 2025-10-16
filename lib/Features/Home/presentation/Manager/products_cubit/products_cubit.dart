import 'package:bloc/bloc.dart';

import '../../../data/repositories/product_repository.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository repository;

  ProductsCubit({required this.repository}) : super(ProductsInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductsLoading());
      final products = await repository.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
