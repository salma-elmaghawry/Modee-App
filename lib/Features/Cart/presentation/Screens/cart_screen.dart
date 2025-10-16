import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markatty/Core/Helpers/spacing.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';
import 'package:markatty/Features/Cart/presentation/Widgets/cart_appbar.dart';
import 'package:markatty/Features/Cart/presentation/Manager/cart_cubit.dart';
import 'package:markatty/Features/Cart/presentation/Manager/cart_state.dart';
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
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartUpdated) {
                    final items = state.items;
                    return ListView(
                      children: [
                        ...items
                            .map((entry) => buildCartEntry(context, entry))
                            .toList(),
                        verticalSpace(16),
                        PaymentMethodDropdown(),
                        verticalSpace(16),
                        PriceSummary(
                          totalItems: items.length,
                          totalPrice: state.total,
                          shippingFee: 0.0,
                          taxes: 0.0,
                        ),
                      ],
                    );
                  }

                  return ListView(
                    children: [
                      const SizedBox(height: 40),
                      Center(child: Text('Your cart is empty')),
                    ],
                  );
                },
              ),
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
