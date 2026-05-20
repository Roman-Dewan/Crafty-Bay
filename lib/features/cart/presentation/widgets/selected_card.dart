import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/widgets/increment_decrement_button.dart';

class SelectedCard extends StatelessWidget {
  const SelectedCard({super.key});

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
            child: Image.asset(AssetPaths.dummyImage, height: 100, width: 100),
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
                            "New Year Special Shoe",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: .w600,
                            ),
                          ),
                          Text(
                            "${context.l10n.color}: Red   ${context.l10n.size}: M",
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.black.withAlpha(400),
                              fontWeight: .w400,
                            ),
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
                      "${AppConstants.takaSymbol}100",
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),
                    IncrementDecrementButton(onChange: (int count) {}),
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
