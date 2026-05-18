import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/utils_extension.dart';

class SizePicker extends StatelessWidget {
  const SizePicker({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onChange,
  });

  final List<String> sizes;
  final String? selectedSize;
  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text("Size", style: context.textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(
          spacing: 8,
          children: sizes.map((size) {
            final bool isSelected = selectedSize == size;

            return GestureDetector(
              onTap: () => onChange(size),
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.themeColor : Colors.transparent,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.themeColor
                        : Colors.grey.shade400,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  size,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
