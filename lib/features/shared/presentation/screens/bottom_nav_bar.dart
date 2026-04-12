import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../category/presentation/category_screen.dart';
import '../../../home/presentation/screen/home_screen.dart';
import '../providers/bottom_nav_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static const String name = "/bottom_nav_bar";

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const SizedBox(),
    const SizedBox(),
  ];
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
