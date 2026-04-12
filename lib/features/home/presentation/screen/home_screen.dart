import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset_paths.dart';
import '../../../shared/presentation/providers/bottom_nav_provider.dart';
import '../../../shared/presentation/widgets/category_card.dart';
import '../widgets/app_bar_icon_button.dart';
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
                    title: "All Categories",
                    onTapSeeAll: () => context
                        .read<BottomNavProvider>()
                        .moveToCategoryScreen(),
                  ),
                  const SizedBox(height: 16),
                  _buildCategoryList(),
                  SectionHeader(title: "Popular", onTapSeeAll: () {}),
                  const HorizontalProductListView(),
                  SectionHeader(title: "Special", onTapSeeAll: () {}),
                  const HorizontalProductListView(),
                  SectionHeader(title: "New", onTapSeeAll: () {}),
                  const HorizontalProductListView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryCard();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }

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
          content: const Text("Are you sure you want to exit?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () => SystemNavigator.pop(),
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }
}

// 50 min.
