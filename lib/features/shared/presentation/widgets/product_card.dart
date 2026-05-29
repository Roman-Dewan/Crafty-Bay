import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../products/data/models/product_model.dart';
import '../../../products/presentation/screens/product_details_screen.dart';
import 'favorite_icon_widget.dart';
import 'rating_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: product.id,
        );
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
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(50),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: product.photos.isNotEmpty
                      ? Image.network(
                          product.photos.first,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                                child: Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                  size: 50,
                                ),
                              ),
                        )
                      : Image.asset(
                          AssetPaths.dummyImage,
                          fit: BoxFit.scaleDown,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: context.textTheme.bodyMedium,
                    ),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          "${AppConstants.takaSymbol} ${product.currentPrice}",
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
