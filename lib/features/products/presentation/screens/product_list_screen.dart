import 'package:crafty_bay/features/category/data/model/category_model.dart';
import 'package:crafty_bay/features/products/presentation/providers/product_list_provider.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final CategoryModel category;
  const ProductListScreen({super.key, required this.category});
  static const String name = "/product_list_screen";

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductListProvider _productListProvider = ProductListProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productListProvider.getProducts(categoryId: widget.category.id);
    });
    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollListener() {
    if (_productListProvider.loading) return;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_productListProvider.loadMoreProductsListInProgress) {
        _productListProvider.getProducts(categoryId: widget.category.id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productListProvider,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.category.title),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Consumer<ProductListProvider>(
          builder: (context, provider, child) {
            return SafeArea(
              child: Visibility(
                visible: !provider.getInProgress,
                replacement: const CenterCircularWidget(),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        controller: _scrollController,
                        itemCount: provider.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.9,
                            ),
                        itemBuilder: (context, index) {
                          return FittedBox(
                            fit: BoxFit.scaleDown,
                            child: ProductCard(
                              product: provider.products[index],
                            ),
                          );
                        },
                      ),
                    ),
                    if (provider.loadMoreProductsListInProgress)
                      const CenterCircularWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
