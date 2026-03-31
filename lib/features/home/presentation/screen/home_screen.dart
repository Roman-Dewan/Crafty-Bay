import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/asset_paths.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_slider.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const SearchTextField(),
              const SizedBox(height: 16),
              const HomeSlider(),
              const SizedBox(height: 16),
              SectionHeader(title: "All Categories", onTapSeeAll: () {}),
              const SizedBox(height: 16),
              // 54 min
            ],
          ),
        ),
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
}
