import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../shared/presentation/providers/bottom_nav_provider.dart';
import '../../../shared/presentation/widgets/category_card.dart';
import '../../../shared/presentation/widgets/center_circular_widget.dart';
import '../providers/category_list_provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static const String name = "/category_screen";

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!context
          .read<CategoryListProvider>()
          .loadMoreCategoriesListInProgress) {
        context.read<CategoryListProvider>().getCategories();
      }
    }
  }

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
          child: Consumer<CategoryListProvider>(
            builder: (context, provider, child) {
              return Visibility(
                visible: provider.getInitialCategoriesListInProgress == false,
                replacement: const CenterCircularWidget(),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        controller: _scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                            ),
                        itemCount: provider.categoriesList.length,
                        itemBuilder: (context, index) {
                          return FittedBox(
                            fit: BoxFit.scaleDown,
                            child: CategoryCard(
                              category: provider.categoriesList[index],
                            ),
                          );
                        },
                      ),
                    ),
                    if (provider.loadMoreCategoriesListInProgress)
                      const CenterCircularWidget(),
                  ],
                ),
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
