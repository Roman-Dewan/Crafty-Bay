import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../products/presentation/screens/product_details_screen.dart';
import 'favorite_icon_widget.dart';
import 'rating_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shadowColor: AppColors.themeColor.withAlpha(50),
        child: SizedBox(
          width: 140,
          child: Column(
            spacing: 4,
            children: [
              Container(
                height: 120,
                width: 140,
                padding: .all(8),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(50),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),

                child: Image.asset(AssetPaths.dummyImage, fit: .scaleDown),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Nike show air jordan 4",
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: context.textTheme.bodyMedium,
                    ),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          "${AppConstants.takaSymbol} 1200",
                          style: context.textTheme.labelMedium?.copyWith(
                            color: AppColors.themeColor,
                            fontWeight: .bold,
                          ),
                        ),
                        RatingWidget(rating: 4.2),
                        FavoriteIconWidget(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
