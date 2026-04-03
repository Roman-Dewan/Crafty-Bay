
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: .center,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.computer,
            size: 35,
            color: AppColors.themeColor,
          ),
        ),
        Text("Electronics", style: TextStyle(fontSize: 16)),
      ],
    );
  }
}