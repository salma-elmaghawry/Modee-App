import 'package:flutter/material.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_images.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          // === Background image ===
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AppImages.model,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // === Gradient overlay ===
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.lightGrey],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "50 % off today",
                    style: AppTextStyles.poppins14Bold(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Limited time picks \njust for you",
                    style: AppTextStyles.poppins14Regular(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 10,
                      ),
                      shape: const StadiumBorder(),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Shop Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
