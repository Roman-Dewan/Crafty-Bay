import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../providers/bottom_nav_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static const String name = "/bottom_nav_bar";

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> screens = [SizedBox(), SizedBox(), SizedBox(), SizedBox()];
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, bottomNavProvider, child) {
        return Scaffold(
          body: screens[bottomNavProvider.selectedIndex],
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) =>
                bottomNavProvider.updateIndex(index),
            selectedIndex: bottomNavProvider.selectedIndex,
            indicatorColor: AppColors.themeColor,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(
                icon: Icon(Icons.dashboard),
                label: "Categories",
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: "Wishlist",
              ),
            ],
          ),
        );
      },
    );
  }
}
// 109