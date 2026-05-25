import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset_paths.dart';
import '../../../../app/extensions/localization_extension.dart';
import '../../../shared/presentation/providers/bottom_nav_provider.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_category_list_widget.dart';
import '../widgets/home_slider.dart';
import '../widgets/horizontal_product_list_view.dart';
import '../widgets/search_text_field.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          _onTapSystemBackButton();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const SearchTextField(),
                  const SizedBox(height: 16),
                  const HomeSlider(),
                  const SizedBox(height: 16),
                  SectionHeader(
                    title: context.l10n.allCategories,
                    onTapSeeAll: () => context
                        .read<BottomNavProvider>()
                        .moveToCategoryScreen(),
                  ),
                  const SizedBox(height: 16),
                  HomeCategoryListWidget(),
                  SectionHeader(
                    title: context.l10n.popular,
                    onTapSeeAll: () {},
                  ),
                  const HorizontalProductListView(),
                  SectionHeader(
                    title: context.l10n.special,
                    onTapSeeAll: () {},
                  ),
                  const HorizontalProductListView(),
                  SectionHeader(
                    title: context.l10n.newProducts,
                    onTapSeeAll: () {},
                  ),
                  const HorizontalProductListView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildCategoryList() {
  //   return
  // }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navLogoSvg, height: 35),
      backgroundColor: Colors.white,
      actions: [
        AppBarIconButton(icon: Icons.person, onTap: _onTapProfileAppBarButton),
        const SizedBox(width: 8),
        AppBarIconButton(
          icon: Icons.call_outlined,
          onTap: _onTapCallAppBarButton,
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          icon: Icons.notifications_none,
          onTap: _onTapNotificationAppBarButton,
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  void _onTapProfileAppBarButton() {}
  void _onTapCallAppBarButton() {}
  void _onTapNotificationAppBarButton() {}
  void _onTapSystemBackButton() {
    if (ModalRoute.of(context)?.canPop == true) {
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Crafty Bay", textAlign: TextAlign.center),
          content: Text(context.l10n.exitPrompt),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.l10n.no),
            ),
            TextButton(
              onPressed: () => SystemNavigator.pop(),
              child: Text(context.l10n.yes),
            ),
          ],
        ),
      );
    }
  }
}
