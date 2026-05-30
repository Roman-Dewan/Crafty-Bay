import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/widgets/center_circular_widget.dart';
import '../../../shared/presentation/widgets/favorite_icon_widget.dart';
import '../../../shared/presentation/widgets/increment_decrement_button.dart';
import '../../../shared/presentation/widgets/rating_widget.dart';
import '../providers/product_details_provider.dart';
import '../widget/color_picker.dart';
import '../widget/product_image_caruosol.dart';
import '../widget/price_and_add_to_cart_section.dart';
import '../widget/size_picker.dart';
import 'review_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  static const String name = '/product_details';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsProvider _productDetailsProvider =
      ProductDetailsProvider();
  String? _selectedSize;
  Color? _selectedColor;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _productDetailsProvider.getProductDetails(
        productId: widget.productId,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productDetailsProvider,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(context.l10n.productDetails),
        ),
        body: Consumer<ProductDetailsProvider>(
          builder: (context, _, _) {
            if (_productDetailsProvider.productDetailsInProgress ?? false) {
              return const Center(child: CenterCircularWidget());
            }
            if (_productDetailsProvider.productDetailsModel == null) {
              return const Center(child: Text("Product details not found"));
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductImageCaruosol(
                          images:
                              _productDetailsProvider
                                  .productDetailsModel
                                  ?.photos ??
                              [],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              _buildTitleSection(
                                context,
                                title: _productDetailsProvider
                                    .productDetailsModel!
                                    .title,
                              ),
                              _ratingReviewSection(context),
                              _buildColorAndSizePicker(context),
                              const SizedBox(height: 8),
                              Text(
                                "Description",
                                style: context.textTheme.titleMedium,
                              ),
                              Text(
                                _productDetailsProvider
                                    .productDetailsModel!
                                    .description,
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
                PriceAndAddToCartSection(
                  price:
                      _productDetailsProvider.productDetailsModel!.currentPrice,
                  onTapAddTocart: () {},
                ),
              ],
            );
          },
        ),
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

  Widget _buildTitleSection(BuildContext context, {required String title}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        IncrementDecrementButton(
          onChange: (int count) {},
          maxCount: _productDetailsProvider.productDetailsModel!.quantity,
        ),
      ],
    );
  }

  Widget _buildColorAndSizePicker(BuildContext context) {
    final productDetails = _productDetailsProvider.productDetailsModel!;
    final List<Color> availableColors = _extractColors(productDetails.colors);
    final List<String> availableSizes = _extractSizes(productDetails.sizes);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Color picker
        if (availableColors.isNotEmpty) ...[
          ColorPicker(
            colors: availableColors,
            selectedColor: _selectedColor,
            onChange: (Color color) {
              setState(() {
                _selectedColor = color;
              });
              if (kDebugMode) log("Selected color is : $color");
            },
          ),
          const SizedBox(height: 8),
        ],

        // size picker
        if (availableSizes.isNotEmpty) ...[
          SizePicker(
            sizes: availableSizes,
            selectedSize: _selectedSize,
            onChange: (String size) {
              setState(() {
                _selectedSize = size;
              });
              if (kDebugMode) log("Selected size is : $size");
            },
          ),
        ],
      ],
    );
  }

  List<Color> _extractColors(List<String> colors) {
    List<Color> parsedColors = [];
    for (String colorString in colors) {
      final parts = colorString.split(',');
      for (String part in parts) {
        final color = _getColorFromString(part.trim());
        if (color != Colors.transparent) {
          parsedColors.add(color);
        }
      }
    }
    return parsedColors;
  }

  List<String> _extractSizes(List<String> sizes) {
    List<String> parsedSizes = [];
    for (String sizeString in sizes) {
      final parts = sizeString.split(',');
      for (String part in parts) {
        if (part.trim().isNotEmpty) {
          parsedSizes.add(part.trim());
        }
      }
    }
    return parsedSizes;
  }

  Color _getColorFromString(String color) {
    final lowerColor = color.toLowerCase();
    switch (lowerColor) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'purple':
        return Colors.purple;
      case 'orange':
        return Colors.orange;
      case 'pink':
        return Colors.pink;
      case 'amber':
        return Colors.amber;
      case 'teal':
        return Colors.teal;
      case 'indigo':
        return Colors.indigo;
      case 'cyan':
        return Colors.cyan;
      case 'lime':
        return Colors.lime;
      case 'grey':
      case 'gray':
        return Colors.grey;
      case 'brown':
        return Colors.brown;
    }
    try {
      String hexColor = color.replaceAll('#', '');
      if (hexColor.length == 6) {
        return Color(int.parse('0xFF$hexColor'));
      } else if (hexColor.length == 8) {
        return Color(int.parse('0x$hexColor'));
      }
    } catch (e) {
      // Ignore exception
    }
    return Colors.transparent;
  }
}
