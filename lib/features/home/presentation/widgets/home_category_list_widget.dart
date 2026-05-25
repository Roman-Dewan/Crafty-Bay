import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../category/presentation/providers/category_list_provider.dart';
import '../../../shared/presentation/widgets/category_card.dart';
import '../../../shared/presentation/widgets/center_circular_widget.dart';

class HomeCategoryListWidget extends StatelessWidget {
  const HomeCategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Consumer<CategoryListProvider>(
        builder: (context, provider, child) {
          if (provider.getInitialCategoriesListInProgress) {
            return CenterCircularWidget();
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: length(provider.categoriesList.length),
            itemBuilder: (context, index) {
              return CategoryCard(category: provider.categoriesList[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
            },
          );
        },
      ),
    );
  }

  int length(int len) {
    return len > 10 ? 10 : len;
  }
}
