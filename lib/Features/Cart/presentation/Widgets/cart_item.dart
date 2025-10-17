import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';
import 'package:markatty/Features/Cart/presentation/Manager/cart_cubit.dart';
import 'package:markatty/Features/Cart/presentation/Manager/cart_state.dart';

Widget buildCartEntry(BuildContext context, CartEntry entry) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final double imageSize = (constraints.maxWidth * 0.22).clamp(
          64.0,
          100.0,
        );

        return Container(
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
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Builder(
                  builder: (context) {
                    final dynamic rawImage = entry.product.image;
                    final String imageStr = (rawImage is String)
                        ? rawImage
                        : '';
                    final bool isNetwork = (() {
                      try {
                        return imageStr.startsWith('http');
                      } catch (_) {
                        return false;
                      }
                    })();

                    if (isNetwork && imageStr.isNotEmpty) {
                      return Image.network(
                        imageStr,
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                              'assets/images/product.png',
                              width: imageSize,
                              height: imageSize,
                              fit: BoxFit.cover,
                            ),
                      );
                    }

                    return Image.asset(
                      'assets/images/product.png',
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(width: imageSize * 0.12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.product.name,
                      style: AppTextStyles.poppins14Bold(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: imageSize * 0.06),
                    Text(
                      entry.product.category,
                      style: AppTextStyles.poppins12Regular(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: imageSize * 0.08),
                    Row(
                      children: [
                        qtyButton(
                          Icons.remove,
                          onTap: () => context.read<CartCubit>().changeQuantity(
                            entry.product,
                            entry.quantity - 1,
                          ),
                        ),
                        SizedBox(width: imageSize * 0.12),
                        Text('${entry.quantity}'),
                        SizedBox(width: imageSize * 0.12),
                        qtyButton(
                          Icons.add,
                          onTap: () => context.read<CartCubit>().changeQuantity(
                            entry.product,
                            entry.quantity + 1,
                          ),
                        ),
                        const Spacer(),
                        qtyButton(
                          Icons.delete_outline,
                          onTap: () => context.read<CartCubit>().removeFromCart(
                            entry.product,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: imageSize * 0.08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            size: imageSize * 0.22,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          "\$${entry.product.price.toStringAsFixed(2)}",
                          style: AppTextStyles.poppins16Bold(
                            color: Colors.black,
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
      },
    ),
  );
}

Widget qtyButton(IconData icon, {required VoidCallback onTap}) {
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
