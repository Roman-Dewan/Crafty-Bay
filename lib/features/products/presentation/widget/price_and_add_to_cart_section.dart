import 'package:crafty_bay/features/products/presentation/providers/add_to_cart_provider.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';

class PriceAndAddToCartSection extends StatelessWidget {
  const PriceAndAddToCartSection({
    super.key,
    required this.price,
    required this.onTapAddTocart,
  });

  final int price;
  final VoidCallback onTapAddTocart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(50),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(context.l10n.price, style: context.textTheme.bodyMedium),
              Text(
                "${AppConstants.takaSymbol}$price",
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Consumer<AddToCartProvider>(
            builder: (context, addToCartProvider, _) {
              return Visibility(
                visible: !addToCartProvider.addToCartInProgress,
                replacement: const CenterCircularWidget(),
                child: FilledButton(
                  style: FilledButton.styleFrom(fixedSize: Size.fromWidth(150)),
                  onPressed: onTapAddTocart,
                  child: Text(context.l10n.addToCart),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
