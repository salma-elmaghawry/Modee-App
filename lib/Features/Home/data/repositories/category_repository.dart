import 'package:markatty/Core/Networking/api_constants.dart';
import 'package:markatty/Core/Networking/api_service.dart';
import '../models/category_model.dart';

class CategoryRepository {
  final ApiService apiService;

  CategoryRepository(this.apiService);

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await apiService.get(ApiConstants.categoriesEndpoint);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
