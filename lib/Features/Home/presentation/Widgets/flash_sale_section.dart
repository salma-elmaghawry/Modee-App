import 'package:flutter/material.dart';
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
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Flash Sale",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Ends at 1:24:02",
              style: TextStyle(color: Colors.redAccent),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) =>
                ProductCard(product: products[index]),
          ),
        )
      ],
    );
  }
}
