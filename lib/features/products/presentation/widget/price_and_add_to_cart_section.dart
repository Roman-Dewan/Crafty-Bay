import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/extensions/utils_extension.dart';

class PriceAndAddToCartSection extends StatelessWidget {
  const PriceAndAddToCartSection({
    super.key,
    required this.price,
    required this.onTapAddTocart,
  });

  final double price;
  final VoidCallback onTapAddTocart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(30),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            children: [
              Text("Price", style: context.textTheme.bodyMedium),
              Text(
                "${AppConstants.takaSymbol}$price",
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          FilledButton(
            style: FilledButton.styleFrom(fixedSize: Size.fromWidth(150)),
            onPressed: onTapAddTocart,
            child: Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
