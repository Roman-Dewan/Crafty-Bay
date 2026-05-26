import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../products/presentation/providers/product_list_provider.dart';
import '../../../shared/presentation/widgets/product_card.dart';

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: context.read<ProductListProvider>().products.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: ProductCard(
                product: context.read<ProductListProvider>().products[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
