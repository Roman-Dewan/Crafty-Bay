import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../products/presentation/providers/product_list_provider.dart';
import '../../../shared/presentation/widgets/product_card.dart';
import '../../../category/presentation/providers/category_list_provider.dart';
import '../../../shared/presentation/widgets/center_circular_widget.dart';

class HorizontalProductListView extends StatefulWidget {
  final String categoryName;
  const HorizontalProductListView({super.key, required this.categoryName});

  @override
  State<HorizontalProductListView> createState() =>
      _HorizontalProductListViewState();
}

class _HorizontalProductListViewState extends State<HorizontalProductListView> {
  final ProductListProvider _productListProvider = ProductListProvider();
  bool _hasFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final categoryProvider = context.watch<CategoryListProvider>();

    if (!_hasFetched && categoryProvider.categoriesList.isNotEmpty) {
      _hasFetched = true;

      try {
        final category = categoryProvider.categoriesList.firstWhere(
          (c) => c.title.toLowerCase() == widget.categoryName.toLowerCase(),
        );
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _productListProvider.getProducts(categoryId: category.id);
        });
      } catch (e) {
        // Category not found
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productListProvider,
      child: Consumer<ProductListProvider>(
        builder: (context, provider, _) {
          if (provider.getInProgress) {
            return const SizedBox(
              height: 200,
              child: Center(child: CenterCircularWidget()),
            );
          }
          if (provider.products.isEmpty) {
            return const SizedBox(
              height: 200,
              child: Center(child: Text("No products found")),
            );
          }
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: ProductCard(product: provider.products[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
