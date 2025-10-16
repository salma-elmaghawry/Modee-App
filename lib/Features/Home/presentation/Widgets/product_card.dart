import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markatty/Core/Helpers/spacing.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_images.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';
import 'package:markatty/Features/Cart/presentation/Manager/cart_cubit.dart';
import 'package:markatty/Features/Home/presentation/Widgets/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModelUi product;
  const ProductCard({super.key, required this.product});

  String _truncateWords(String text, int wordLimit) {
    final words = text.trim().split(RegExp(r'\s+'));
    if (words.length <= wordLimit) return text;
    return words.sublist(0, wordLimit).join(' ') + '...';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /// margin: const EdgeInsets.only(right: 12, bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: (product.image.startsWith('http'))
                ? Image.network(
                    product.image,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      AppImages.product,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    AppImages.product,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _truncateWords(product.name, 10),
                        style: AppTextStyles.poppins14Regular(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          product.rating.toString(),
                          style: AppTextStyles.poppins14Regular(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          style: AppTextStyles.poppins14Bold(
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          "\$${(product.price + 20).toStringAsFixed(2)}",
                          style: AppTextStyles.poppins14Regular(
                            fontSize: 12,
                            color: Colors.grey,
                          ).copyWith(decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    const Spacer(),

                    IconButton(
                      onPressed: () {
                        try {
                          final cubit = context.read<CartCubit>();
                          cubit.addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to cart')),
                          );
                        } catch (e) {
                          // If CartCubit isn't provided higher up, ignore silently
                        }
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        size: 20,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
