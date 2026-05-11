import 'package:flutter/material.dart';

import '../../shared/presentation/widgets/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  static const String name = "/wish_list_screen";

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            // crossAxisSpacing: 8,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return FittedBox(fit: BoxFit.scaleDown, child: const ProductCard());
          },
        ),
      ),
    );
  }
}
