import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app/app_colors.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: false,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
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
          // items: [1, 2, 3, 4, 5].map((i) {
          //   return Builder(
          //     builder: (BuildContext context) {
          //       return Container(
          //         width: MediaQuery.of(context).size.width,
          //         margin: EdgeInsets.symmetric(horizontal: 5.0),
          //         decoration: BoxDecoration(
          //           color: Colors.green,
          //           borderRadius: BorderRadius.circular(12),
          //         ),
          //         child: Text(
          //           'text $i',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(fontSize: 16.0),
          //         ),
          //       );
          //     },
          //   );
          // }).toList(),
          items: [
            buildItem(1),
            buildItem(2),
            buildItem(3),
            buildItem(4),
            buildItem(5),
          ],
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: PageController(initialPage: _currentIndex),
          count: 5,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: AppColors.themeColor,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildItem(int i) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text('text $i')),
    );
  }
}
