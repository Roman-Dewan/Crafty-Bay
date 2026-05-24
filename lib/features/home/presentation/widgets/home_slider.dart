import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/widgets/center_circular_widget.dart';
import '../providers/slides_provider.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<SlidesProvider>(
      builder: (context, slidesProvider, child) {
        return Column(
          children: [
            Visibility(
              visible: slidesProvider.getSlidesProgress == false,
              replacement: SizedBox(height: 200, child: CenterCircularWidget()),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
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
                items: slidesProvider.slides.map((slide) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(slide.photoUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 8),
            if (slidesProvider.slides.isNotEmpty)
              SmoothPageIndicator(
                controller: PageController(initialPage: _currentIndex),
                count: slidesProvider.slides.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: AppColors.themeColor,
                  dotColor: Colors.grey,
                ),
              ),
          ],
        );
      },
    );
  }
}

// e comer 2 40min
