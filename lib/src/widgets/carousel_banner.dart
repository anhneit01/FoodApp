import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/theme/color.dart';
import 'package:food_app/theme/font_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselBanner extends StatefulWidget {
  CarouselBanner({Key? key}) : super(key: key);

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  int activeIndex = 0;

  final images = [
    'assets/images/carousel_home(1).png',
    'assets/images/carousel_home(2).png',
    'assets/images/carousel_home(3).png',
    'assets/images/carousel_home(4).png',
    'assets/images/carousel_home(1).png',
    'assets/images/carousel_home(2).png',
    'assets/images/carousel_home(3).png',
    'assets/images/carousel_home(4).png'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return buildImage(images.elementAt(index), index);
          },
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          )
        ),
        const SizedBox(height: 5.0),
        buildIndicator()
      ],
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              urlImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black,
                    Colors.black45,
                    Colors.black12,
                    Colors.black.withOpacity(0)
                  ])),
        ),
        const Positioned(
            left: 30,
            top: 80,
            child: Text(
              'Black Friday',
              style: TextStyle(
                  fontSize: 28,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w700),
            )),
        const Positioned(
            left: 30,
            top: 120,
            child: Text(
                'Pizza, dish of Italian origin consisting \nheated to a very high temperature—and served hot',
                style: paragraphLight)),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: images.length,
    effect: const ExpandingDotsEffect(
      expansionFactor: 4,
      dotWidth: 6,
      dotHeight: 6,
      spacing: 4,
      activeDotColor: kDarkGreyColor
    ),
  );
}
