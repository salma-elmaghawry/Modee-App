import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markatty/Core/Helpers/spacing.dart';
import 'package:markatty/Features/Cart/presentation/Widgets/cart_appbar.dart';
import 'package:markatty/Features/Cart/presentation/Manager/cart_cubit.dart';
import 'package:markatty/Features/Cart/presentation/Manager/cart_state.dart';
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
                            .map((entry) => _buildCartEntry(context, entry))
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

  Widget _buildCartEntry(BuildContext context, CartEntry entry) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: (entry.product.image.startsWith('http'))
                ? Image.network(
                    entry.product.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/product.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.product.name),
                const SizedBox(height: 6),
                Text('\$${entry.product.price.toStringAsFixed(2)}'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => context.read<CartCubit>().changeQuantity(
                        entry.product,
                        entry.quantity - 1,
                      ),
                    ),
                    Text('${entry.quantity}'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => context.read<CartCubit>().changeQuantity(
                        entry.product,
                        entry.quantity + 1,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => context.read<CartCubit>().removeFromCart(
                        entry.product,
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
