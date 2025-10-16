import 'package:markatty/Features/Home/presentation/Widgets/product_model.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final int ratingCount;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.ratingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final ratingObj = json['rating'] as Map<String, dynamic>?;
    return ProductModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? '',
      image: json['image'] as String? ?? '',
      rating: (ratingObj != null && ratingObj['rate'] != null)
          ? (ratingObj['rate'] as num).toDouble()
          : 0.0,
      ratingCount: (ratingObj != null && ratingObj['count'] != null)
          ? (ratingObj['count'] as num).toInt()
          : 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
    'rating': {'rate': rating, 'count': ratingCount},
  };

  ProductModelUi toProductModel() {
    return ProductModelUi(
      name: title,
      price: price,
      rating: rating,
      image: image,
      category: category,
    );
  }
}
