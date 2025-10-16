import 'package:flutter/material.dart';
import 'package:markatty/Core/Helpers/spacing.dart';
import 'package:markatty/Features/Cart/presentation/Widgets/cart_appbar.dart';
import 'package:markatty/Features/Cart/presentation/Widgets/cart_item.dart';
import 'package:markatty/Features/Cart/presentation/widgets/payment_method_dropdown.dart';
import 'package:markatty/Features/Cart/presentation/widgets/price_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: const CartAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CartItem(price: 29.99),
                  CartItem(price: 49.99),
                  verticalSpace(16),
                  PaymentMethodDropdown(),
                  verticalSpace(16),
                   PriceSummary(
                    totalItems: 2,
                    totalPrice: 115.92,
                    shippingFee: 0.0,
                    taxes: 0.0,
                  ),
                ],
              ),
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
