import 'package:bloc/bloc.dart';

import 'package:markatty/Features/Home/data/repositories/product_repository.dart';
import 'package:markatty/Features/Home/presentation/Widgets/product_model.dart';
import 'package:markatty/Features/Home/presentation/Manager/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository repository;

  ProductsCubit({required this.repository}) : super(ProductsInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductsLoading());
      final apiProducts = await repository.fetchProducts();
      final products = apiProducts
          .map(
            (p) => ProductModelUi(
              category: p.category,
              name: p.title,
              price: p.price,
              rating: p.rating,
              image: p.image,
            ),
          )
          .toList();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
