import 'package:crafty_bay/features/shared/presentation/widgets/increment_decrement_button.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/widgets/favorite_icon_widget.dart';
import '../../../shared/presentation/widgets/rating_widget.dart';
import '../widget/product_image_caruosol.dart';
import '../widget/price_and_add_to_cart_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const String name = '/product_details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ProductImageCaruosol(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Nike 2026 - New Year Special Collection",
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    fontWeight: .bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IncrementDecrementButton(onChange: (int count) {}),
                        ],
                      ),
                      Row(
                        children: [
                          RatingWidget(rating: 4.2),
                          TextButton(onPressed: () {}, child: Text("Reviews")),
                          FavoriteIconWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PriceAndAddToCartSection(price: 2000, onTapAddTocart: () {}),
        ],
      ),
    );
  }
}
