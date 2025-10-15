import 'package:flutter/material.dart';
import 'package:markatty/Features/Home/presentation/Widgets/app_header.dart';
import 'package:markatty/Features/Home/presentation/Widgets/brand_section.dart';
import 'package:markatty/Features/Home/presentation/Widgets/flash_sale_section.dart';
import 'package:markatty/Features/Home/presentation/Widgets/location_selector.dart';
import 'package:markatty/Features/Home/presentation/Widgets/offer_banner.dart';
import 'package:markatty/Core/Helpers/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(15),
              const AppHeader(),
              verticalSpace(20),
              const LocationSelector(),
              verticalSpace(20),
              const OfferBanner(),
              verticalSpace(20),
              const BrandSection(),
              verticalSpace(20),
              const FlashSaleSection(),
            ],
          ),
        ),
      ),
    );
  }
}
