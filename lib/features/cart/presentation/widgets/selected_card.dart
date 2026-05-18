import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/widgets/increment_decrement_button.dart';

class SelectedCard extends StatelessWidget {
  const SelectedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Image.asset(AssetPaths.dummyImage, fit: BoxFit.cover),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "New Year Special Shoe",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: .w600,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: _onTapDeleteButton,
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Color: Red   Size: M",
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
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
            ),
          ],
        ),
      ),
    );
  }

  void _onTapDeleteButton() {}
}
