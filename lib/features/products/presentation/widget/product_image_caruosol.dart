import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app/app_colors.dart';

class ProductImageCaruosol extends StatefulWidget {
  const ProductImageCaruosol({super.key});

  @override
  State<ProductImageCaruosol> createState() => _ProductImageCaruosolState();
}

class _ProductImageCaruosolState extends State<ProductImageCaruosol> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220.0,
            autoPlay: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1.1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: [
            buildItem(1),
            buildItem(2),
            buildItem(3),
            buildItem(4),
            buildItem(5),
          ],
        ),
        Positioned.fill(
          bottom: 20,
          left: 0,
          right: 0,
          child: Align(
            alignment: .bottomCenter,
            child: SmoothPageIndicator(
              controller: PageController(initialPage: _currentIndex),
              count: 5,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: AppColors.themeColor,
                dotColor: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildItem(int i) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text('text $i')),
    );
  }
}
