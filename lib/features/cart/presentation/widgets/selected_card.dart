import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/widgets/center_circular_widget.dart';
import '../../../shared/presentation/widgets/increment_decrement_button.dart';
import '../../data/models/cart_model.dart';

import 'package:provider/provider.dart';
import '../../../cart/presentation/providers/cart_list_provider.dart';

class SelectedCard extends StatelessWidget {
  final CartModel cart;
  const SelectedCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: AppColors.themeColor.withAlpha(100),
      elevation: 5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              cart.product.photos.first,
              height: 100,
              width: 100,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset(AssetPaths.dummyImage),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const CenterCircularWidget();
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cart.product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: .w600,
                            ),
                          ),
                          Row(
                            children: [
                              if (cart.color != null &&
                                  cart.color!.isNotEmpty) ...[
                                Text(
                                  "${context.l10n.color}: ${cart.color}   ",
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: Colors.black.withAlpha(400),
                                    fontWeight: .w400,
                                  ),
                                ),
                              ],
                              if (cart.size != null &&
                                  cart.size!.isNotEmpty) ...[
                                Text(
                                  "${context.l10n.size}: ${cart.size}",
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: Colors.black.withAlpha(400),
                                    fontWeight: .w400,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: _onTapDeleteButton,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${AppConstants.takaSymbol}${cart.product.currentPrice * cart.quantity}",
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),
                    IncrementDecrementButton(
                      initilValue: cart.quantity,
                      onChange: (int count) {
                        context.read<CartListProvider>().changeQuantity(
                          cart.id,
                          count,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapDeleteButton() {}
}
