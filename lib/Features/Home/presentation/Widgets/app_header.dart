import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/logo.png', height: 30),
            const SizedBox(width: 6),
            const Text(
              "Modee",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.search, size: 26),
            SizedBox(width: 12),
            Icon(Icons.shopping_bag_outlined, size: 26),
          ],
        ),
      ],
    );
  }
}
