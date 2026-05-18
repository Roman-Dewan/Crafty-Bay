import 'package:flutter/material.dart';

import '../../../../app/extensions/utils_extension.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onChange,
  });

  final List<Color> colors;
  final Color? selectedColor;
  final ValueChanged<Color> onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text("Color", style: context.textTheme.titleMedium),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 12,
            children: colors.map((color) {
              final bool isSelected = selectedColor == color;
              final Color checkColor = color.computeLuminance() > 0.5
                  ? Colors.black87
                  : Colors.white;

              return GestureDetector(
                onTap: () => onChange(color),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.black54 : Colors.grey.shade300,
                      width: isSelected ? 2.5 : 1.5,
                    ),
                  ),
                  child: isSelected
                      ? Icon(Icons.check, color: checkColor, size: 20)
                      : null,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
