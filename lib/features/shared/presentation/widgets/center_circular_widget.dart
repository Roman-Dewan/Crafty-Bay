import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CenterCircularWidget extends StatelessWidget {
  const CenterCircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.themeColor),
    );
  }
}
