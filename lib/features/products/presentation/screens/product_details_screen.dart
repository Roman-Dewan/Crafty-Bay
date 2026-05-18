import 'dart:developer';

import 'package:crafty_bay/features/shared/presentation/widgets/increment_decrement_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/widgets/favorite_icon_widget.dart';
import '../../../shared/presentation/widgets/rating_widget.dart';
import '../widget/color_picker.dart';
import '../widget/product_image_caruosol.dart';
import '../widget/price_and_add_to_cart_section.dart';
import '../widget/size_picker.dart';
import 'review_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const String name = '/product_details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? _selectedSize;
  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(context.l10n.productDetails),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCaruosol(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        _buildTitleSection(context),
                        _ratingReviewSection(context),
                        _buildColorAndSizePicker(context),
                        const SizedBox(height: 8),
                        Text(
                          "Description",
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          """This is product description. It is a long established fact that a reader will be distracted by the rhis is product description. It is a long established fact that a reader will be distracted by the rhis is product description. It is a long established fact that a reader will be distracted by the rhis is product description. It is a long established fact that a reader will be distracted by the rhis is product description. It is a long established fact that a reader will be distracted by the rhis is product description. It is a long established fact that a reader will be distracted by the rhis is product description. It is a long established fact that a reader will be distracted by the rhis is product description. It is a long established fact that a reader will be distracted by the rseadable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.""",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PriceAndAddToCartSection(price: 2000, onTapAddTocart: () {}),
        ],
      ),
    );
  }

  Widget _ratingReviewSection(BuildContext context) {
    return Row(
      children: [
        const RatingWidget(rating: 4.2),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ReviewScreen.name);
          },
          child: Text(context.l10n.reviews),
        ),
        const FavoriteIconWidget(),
      ],
    );
  }

  Widget _buildTitleSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "Nike 2026 - New Year Special Collection",
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        IncrementDecrementButton(onChange: (int count) {}),
      ],
    );
  }

  Widget _buildColorAndSizePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Color picker
        ColorPicker(
          colors: const [
            Colors.red,
            Colors.blue,
            Colors.green,
            Colors.yellow,
            Colors.black,
            Colors.purple,
            Colors.orange,
            Colors.pink,
            Colors.amber,
            Colors.teal,
            Colors.indigo,
            Colors.cyan,
            Colors.lime,
            Colors.pink,
          ],
          selectedColor: _selectedColor,
          onChange: (Color color) {
            setState(() {
              _selectedColor = color;
            });
            if (kDebugMode) log("Selected color is : $color");
          },
        ),

        const SizedBox(height: 8),

        // portion picker
        SizePicker(
          sizes: const [
            "S",
            "M",
            "L",
            "XL",
            "XXL",
            "XXXL",
            "A",
            "B",
            "C",
            "D",
            "E",
            "F",
            "G",
            "H",
            "I",
            "J",
            "K",
            "L",
            "M",
            "N",
            "O",
            "P",
            "Q",
            "R",
            "S",
            "T",
            "U",
            "V",
            "W",
            "X",
            "Y",
            "Z",
          ],
          selectedSize: _selectedSize,
          onChange: (String size) {
            setState(() {
              _selectedSize = size;
            });
            if (kDebugMode) log("Selected size is : $size");
          },
        ),
      ],
    );
  }
}
