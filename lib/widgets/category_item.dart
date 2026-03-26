import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}