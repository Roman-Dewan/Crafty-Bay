import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(4),
      decoration: BoxDecoration(
        color: AppColors.themeColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(Icons.favorite, color: Colors.white, size: 12),
    );
  }
}