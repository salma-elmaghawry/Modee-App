import 'package:flutter/material.dart';
import 'package:markatty/Core/Helpers/spacing.dart';
import 'package:markatty/Core/Theme/app_images.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';

class CartItem extends StatefulWidget {
  final double price;
  const CartItem({Key? key, required this.price}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();

  static Widget _qtyButton(IconData icon, {required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: Icon(icon, size: 23, color: Colors.black87),
        ),
      ),
    );
  }
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              AppImages.product,
              width: 150,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Men’s T-Shirt",
                  style: AppTextStyles.poppins12Regular(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  "Casual Wear",
                  style: AppTextStyles.poppins14Bold(color: Colors.black),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CartItem._qtyButton(
                          Icons.remove,
                          onTap: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                              }
                            });
                          },
                        ),
                        horizontalSpace(15),
                        Text("$quantity", style: TextStyle(fontSize: 15)),
                        horizontalSpace(15),
                        CartItem._qtyButton(
                          Icons.add,
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),

                    // Price
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                    Text(
                      "\$${widget.price.toStringAsFixed(2)}",
                      style: AppTextStyles.poppins16Bold(color: Colors.black),
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
