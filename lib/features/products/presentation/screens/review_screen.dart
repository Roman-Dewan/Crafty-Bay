import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../widget/review_card.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});
  static const String name = '/review';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 6,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ReviewCard(),
                );
              },
            ),
          ),
          _buildBottomPart(context),
        ],
      ),
    );
  }

  Widget _buildBottomPart(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      width: double.infinity,
      height: 70,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text("Reviews (1000)", style: context.textTheme.titleMedium),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 30, color: Colors.white),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
