import 'package:crafty_bay/features/wishlist/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/localization_extension.dart';
import '../../../auth/presentation/screens/sign_in_screen.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../category/presentation/providers/category_list_provider.dart';
import '../../../category/presentation/screens/category_screen.dart';
import '../../../home/presentation/providers/slides_provider.dart';
import '../../../home/presentation/screen/home_screen.dart';
import '../providers/bottom_nav_provider.dart';
import '../../../cart/presentation/providers/cart_list_provider.dart';

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SlidesProvider>().getHomeSlides();
      context.read<CategoryListProvider>().getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, bottomNavProvider, child) {
        return Scaffold(
          body: IndexedStack(
            index: bottomNavProvider.selectedIndex,
            children: screens,
          ),
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) async {
              if (bottomNavProvider.shouldVerifyLoginState(index) &&
                  !await bottomNavProvider.isAlreadyLogin()) {
                if (!context.mounted) return;
                Navigator.pushNamed(context, SignInScreen.name);
                return;
              }
              if (index == 2) {
                if (context.mounted) {
                  context.read<CartListProvider>().getCarts();
                }
              }
              bottomNavProvider.updateIndex(index);
            },
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
