import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markatty/Features/Home/data/models/category_model.dart';
import 'package:markatty/Features/Home/data/repositories/category_repository.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository repository;

  CategoryCubit(this.repository) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
      final List<CategoryModel> categories = await repository.fetchCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
