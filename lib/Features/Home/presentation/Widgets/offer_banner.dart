import 'package:flutter/material.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_images.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.lightGrey],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "50 % off today",
                    style: AppTextStyles.poppins14Bold(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Limited time picks \njust for you",
                    style: AppTextStyles.poppins14Regular(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 12),
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
                    child: Text(
                      "Shop Now",
                      style: AppTextStyles.poppins14Bold(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            right: 1,
            top: -35,
            bottom: -40,
            child: Image.asset(AppImages.model, width: 230, height: 200),
          ),
        ],
      ),
    );
  }
}
