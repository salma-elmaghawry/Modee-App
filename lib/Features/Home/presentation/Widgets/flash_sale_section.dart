import 'package:flutter/material.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';
import 'package:markatty/Features/Home/presentation/Widgets/product_card.dart';
import 'package:markatty/Features/Home/presentation/Widgets/product_model.dart';
import 'product_card.dart';

class FlashSaleSection extends StatelessWidget {
  const FlashSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      ProductModel(
        name: "Puff Sleeved Blouse",
        price: 16.99,
        rating: 4.9,
        image: "assets/blouse.png",
      ),
      ProductModel(
        name: "Printed T-Shirt",
        price: 11.99,
        rating: 4.8,
        image: "assets/tshirt.png",
      ),
      ProductModel(
        name: "Puff Sleeved Blouse",
        price: 16.99,
        rating: 4.9,
        image: "assets/blouse.png",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Flash Sale",
              style: AppTextStyles.poppins14Bold(fontSize: 20),
            ),
            Row(
              children: [
                Text(
                  "Ends at ",
                  style: AppTextStyles.poppins14Regular(color: AppColors.grey),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "1 : 24 : 02",
                    style: AppTextStyles.poppins14Regular(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 160 / 230,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) =>
              ProductCard(product: products[index]),
        ),
      ],
    );
  }
}
