import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';
import 'package:markatty/Features/Home/presentation/Widgets/product_card.dart';
// import 'package:markatty/Features/Home/presentation/Widgets/product_model.dart';
import '../../data/repositories/product_repository.dart';
import '../Manager/products_cubit/products_cubit.dart';
import '../Manager/products_cubit/products_state.dart';
import 'package:dio/dio.dart';
import 'package:markatty/Core/Networking/api_service.dart';

class FlashSaleSection extends StatelessWidget {
  const FlashSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final apiService = ApiService(dio);

    return BlocProvider<ProductsCubit>(
      create: (_) =>
          ProductsCubit(repository: ProductRepository(apiService))
            ..fetchProducts(),
      child: Column(
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
                    style: AppTextStyles.poppins14Regular(
                      color: AppColors.grey,
                    ),
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
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductsError) {
                return Center(child: Text(state.message));
              } else if (state is ProductsLoaded) {
                final apiProducts = state.products;
                final products = apiProducts
                    .map((e) => e.toProductModel())
                    .toList();
                return GridView.builder(
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
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
