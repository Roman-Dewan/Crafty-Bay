import 'package:crafty_bay/features/wishlist/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/localization_extension.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../category/presentation/screens/category_screen.dart';
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
    const CartScreen(),
    const WishListScreen(),
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
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home),
                label: context.l10n.home,
              ),
              NavigationDestination(
                icon: const Icon(Icons.dashboard),
                label: context.l10n.categories,
              ),
              NavigationDestination(
                icon: const Icon(Icons.shopping_cart),
                label: context.l10n.cart,
              ),
              NavigationDestination(
                icon: const Icon(Icons.favorite_outline),
                label: context.l10n.wishlist,
              ),
            ],
          ),
        );
      },
    );
  }
}
