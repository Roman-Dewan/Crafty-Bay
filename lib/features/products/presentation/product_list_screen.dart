import 'package:flutter/material.dart';

import '../../shared/presentation/widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final String categoryName;
  const ProductListScreen({super.key, required this.categoryName});
  static const String name = "/product_list_screen";

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
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
