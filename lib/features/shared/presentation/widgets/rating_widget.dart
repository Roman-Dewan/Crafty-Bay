import 'package:flutter/material.dart';

import '../../../../app/extensions/utils_extension.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: .center,
      children: [
        Icon(Icons.star, color: Colors.amber, size: 16),
        Text(
          rating.toString(),
          style: context.textTheme.labelSmall?.copyWith(fontWeight: .w500),
        ),
      ],
    );
  }
}
