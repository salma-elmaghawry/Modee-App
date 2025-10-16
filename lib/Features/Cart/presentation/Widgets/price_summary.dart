import 'package:flutter/material.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';

class PriceSummary extends StatelessWidget {
  final int totalItems;
  final double totalPrice;
  final double shippingFee;
  final double taxes;

  const PriceSummary({
    Key? key,
    required this.totalItems,
    required this.totalPrice,
    required this.shippingFee,
    required this.taxes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double finalTotal = totalPrice + shippingFee + taxes;

    return Container(
      padding: const EdgeInsets.all(14),
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
      child: Column(
        children: [
          _buildRow(
            "Items ($totalItems)",
            "\$${totalPrice.toStringAsFixed(2)}",
          ),
          const SizedBox(height: 6),
          _buildRow(
            "Shipping Fee",
            shippingFee == 0 ? "Free" : "\$${shippingFee.toStringAsFixed(2)}",
          ),
          const SizedBox(height: 6),
          _buildRow(
            "Taxes",
            taxes == 0 ? "Free" : "\$${taxes.toStringAsFixed(2)}",
          ),
          const Divider(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Total ", style: AppTextStyles.poppins14Regular()),
                  Text(
                    "\$ ${finalTotal.toStringAsFixed(2)}",
                    style: AppTextStyles.poppins16Bold(),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: AppColors.white,
                      title: Text(
                        "Order Completed",
                        style: AppTextStyles.poppins16Bold(),
                      ),
                      content: Text(
                        "Thank you for your purchase",
                        style: AppTextStyles.poppins14Regular(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "OK",
                            style: AppTextStyles.poppins14Bold(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  //padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  "Checkout",
                  style: AppTextStyles.poppins14Bold(color: AppColors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
