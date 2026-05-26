import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../products/presentation/screens/product_list_screen.dart';
import '../../../category/data/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: category,
        );
      },
      child: Column(
        spacing: 4,
        crossAxisAlignment: .center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              category.icon,
              height: 48,
              width: 48,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(
                  Icons.image_not_supported_rounded,
                  color: Colors.grey,
                  size: 50,
                ),
              ),
            ),
          ),
          Text(
            category.title,
            maxLines: 1,
            overflow: .ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: AppColors.themeColor,
            ),
          ),
        ],
      ),
    );
  }
}
