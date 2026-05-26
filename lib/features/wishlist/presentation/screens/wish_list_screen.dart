import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../products/presentation/providers/product_list_provider.dart';
import '../../../shared/presentation/widgets/product_card.dart';

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
      appBar: AppBar(title: Text(context.l10n.wishlist)),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            // crossAxisSpacing: 8,
          ),
          itemCount: context.read<ProductListProvider>().products.length,
          itemBuilder: (context, index) {
            return FittedBox(
              fit: BoxFit.scaleDown,
              child: ProductCard(
                product: context.read<ProductListProvider>().products[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
