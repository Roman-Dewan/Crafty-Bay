import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/extensions/utils_extension.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shadowColor: AppColors.themeColor.withAlpha(50),
      child: SizedBox(
        width: 140,
        child: Column(
          spacing: 8,
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
                    style: context.textTheme.titleSmall,
                  ),

                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("${AppConstants.takaSymbol} 1200"),
                      Wrap(
                        alignment: .center,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Text("4.5"),
                        ],
                      ),
                      Container(
                        padding: .all(4),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
