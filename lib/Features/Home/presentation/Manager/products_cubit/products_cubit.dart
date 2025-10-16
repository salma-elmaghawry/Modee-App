import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:markatty/Core/Networking/api_service.dart';

import '../../../data/repositories/product_repository.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository repository;

  ProductsCubit({ProductRepository? repository})
    : repository = repository ?? ProductRepository(ApiService(Dio())),
      super(ProductsInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductsLoading());
      final apiProducts = await repository.fetchProducts();
      final products = apiProducts.map((p) => p.toProductModel()).toList();
      emit(ProductsLoaded(products));
    } catch (e) {
      String message = 'Failed to load products';
      if (e is ApiException) {
        message = e.message;
      } else if (e is DioException) {
        message = e.message ?? message;
      } else {
        message = e.toString();
      }
      emit(ProductsError(message));
    }
  }
}
