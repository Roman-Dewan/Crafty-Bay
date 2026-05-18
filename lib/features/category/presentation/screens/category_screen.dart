import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../shared/presentation/providers/bottom_nav_provider.dart';
import '../../../shared/presentation/widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static const String name = "/category_screen";

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        _onTapBackButton();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: _onTapBackButton,
          ),
          title: Text(context.l10n.categories),
        ),
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return FittedBox(
                fit: BoxFit.scaleDown,
                child: const CategoryCard(),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onTapBackButton() {
    context.read<BottomNavProvider>().moveToHomeScreen();
  }
}
