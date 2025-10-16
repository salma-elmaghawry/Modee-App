import 'package:flutter/material.dart';
import 'package:markatty/Features/Home/presentation/Widgets/animated_bottm_nav_bar.dart';
import 'package:markatty/Features/Home/presentation/Widgets/app_header.dart';
import 'package:markatty/Features/Home/presentation/Widgets/brand_section.dart';
import 'package:markatty/Features/Home/presentation/Widgets/flash_sale_section.dart';
import 'package:markatty/Features/Home/presentation/Widgets/location_selector.dart';
import 'package:markatty/Features/Home/presentation/Widgets/offer_banner.dart';
import 'package:markatty/Core/Helpers/spacing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          _HomeContent(),
          PlaceholderWidget(icon: Icons.favorite, title: 'Wishlist'),
          PlaceholderWidget(icon: Icons.person, title: 'Profile'),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const PlaceholderWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
