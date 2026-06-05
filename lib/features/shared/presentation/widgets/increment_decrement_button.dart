import 'package:crafty_bay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class IncrementDecrementButton extends StatefulWidget {
  const IncrementDecrementButton({
    super.key,
    required this.onChange,
    this.width = 100,
    this.maxCount = 20,
    this.initilValue = 1,
  });
  final double width;
  final int maxCount;
  final Function(int count) onChange;
  final int initilValue;

  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  int _counter = 1;

  @override
  void initState() {
    super.initState();
    _counter = widget.initilValue;
  }

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
              if (_counter < widget.maxCount) {
                _counter++;
                setState(() {});
                widget.onChange(_counter);
              }
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
