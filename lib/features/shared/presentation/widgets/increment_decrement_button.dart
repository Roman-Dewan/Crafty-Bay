import 'package:crafty_bay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class IncrementDecrementButton extends StatefulWidget {
  const IncrementDecrementButton({
    super.key,
    this.width = 100,
    required this.onChange,
  });
  final double width;
  final Function(int count) onChange;

  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: .center,
        children: [
          _buildButton(
            icon: Icons.remove,
            onTap: () {
              if (_counter > 1) {
                _counter--;
                setState(() {});
                widget.onChange(_counter);
              }
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              _counter.toString(),
              style: context.textTheme.titleMedium?.copyWith(fontWeight: .bold),
            ),
          ),
          _buildButton(
            icon: Icons.add,
            onTap: () {
              _counter++;
              setState(() {});
              widget.onChange(_counter);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
