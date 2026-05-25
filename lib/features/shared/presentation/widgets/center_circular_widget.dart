import 'package:flutter/cupertino.dart';

import '../../../../app/app_colors.dart';

class CenterCircularWidget extends StatelessWidget {
  const CenterCircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: AppColors.thirdColor,
        radius: 20,
        animating: true,
      ),
    );
  }
}
