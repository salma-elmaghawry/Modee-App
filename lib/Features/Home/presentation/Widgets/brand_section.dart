import 'package:flutter/material.dart';
import 'package:markatty/Core/Theme/app_images.dart';
import 'package:markatty/Core/Theme/app_text_styles.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = [
      {'name': 'H&M', 'image': AppImages.hm},
      {'name': 'Zara', 'image': AppImages.hm},
      {'name': 'Lacoste', 'image': AppImages.hm},
      {'name': 'Ralph L', 'image': AppImages.hm},
      {'name': 'Pull & B', 'image': AppImages.hm},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Popular Brand", style: AppTextStyles.poppins14Bold(fontSize: 20)),
        const SizedBox(height: 10),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Container(
                width: 70,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(brands[index]['image']!),
                      backgroundColor: Colors.grey.shade200,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      brands[index]['name']!,
                      style: AppTextStyles.poppins14Regular(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
