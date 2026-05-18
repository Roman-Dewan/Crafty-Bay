import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/extensions/utils_extension.dart';

class CartBottomWidget extends StatelessWidget {
  const CartBottomWidget({
    super.key,
    required this.price,
    required this.onTapCheckout,
  });

  final double price;
  final VoidCallback onTapCheckout;

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
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            children: [
              Text("Total Price", style: context.textTheme.bodyMedium),
              Text(
                "${AppConstants.takaSymbol}$price",
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          FilledButton(
            style: FilledButton.styleFrom(fixedSize: Size.fromWidth(150)),
            onPressed: onTapCheckout,
            child: Text("Checkout"),
          ),
        ],
      ),
    );
  }
}
