import 'package:markatty/Core/Networking/api_constants.dart';
import 'package:markatty/Core/Networking/api_service.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository(this.apiService);

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await apiService.get(ApiConstants.productsEndpoint);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
          'Failed to load products (status: ${response.statusCode})',
        );
      }
    } catch (e) {
      // Re-throw to allow callers (cubits) to translate into UI messages
      rethrow;
    }
  }
}
