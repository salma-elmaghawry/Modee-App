import 'package:flutter/material.dart';
import 'package:markatty/Core/Helpers/spacing.dart';
import 'package:markatty/Core/Theme/app_colors.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Center(
              child: Icon(Icons.location_on_outlined, color: AppColors.primary),
            ),
          ),
          horizontalSpace(8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Send To",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  "Brisbane, Queensland",
                  style: AppTextStyles.poppins14Regular(),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              "Change",
              style: AppTextStyles.poppins14Bold(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
