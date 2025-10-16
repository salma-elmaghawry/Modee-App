import 'package:flutter/material.dart';
import 'package:markatty/Config/Routes/routes.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';

class AnimatedBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;

  const AnimatedBottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              icon: Icons.home,
              label: 'Home',
              isActive: currentIndex == 0,
              onTap: () => onTap(0),
            ),

            BottomNavItem(
              icon: Icons.favorite_border,
              label: 'Favourites',
              isActive: currentIndex == 2,
              onTap: () => onTap(2),
            ),
            BottomNavItem(
              icon: Icons.shopping_cart_outlined,
              label: 'Cart',
              isActive: currentIndex == 3,
              onTap: () => Navigator.pushNamed(context, Routes.cart),
            ),
            BottomNavItem(
              icon: Icons.person_outline,
              label: 'Profile',
              isActive: currentIndex == 4,
              onTap: () => onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const BottomNavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.white : AppColors.grey,
              size: 24,
            ),
            if (isActive) ...[
              const SizedBox(width: 4),
              Text(
                label,
                style: AppTextStyles.poppins14Bold(color: AppColors.white),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
