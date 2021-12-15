
import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselBanner extends StatelessWidget {
  final images = [
    'assets/images/carousel_home(1).png',
    'assets/images/carousel_home(2).png',
    'assets/images/carousel_home(3).png',
    'assets/images/carousel_home(4).png'
  ];

  final _pageController = PageController();

  CarouselBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 150,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: images.map((image) => Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal:10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal:10.0),
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
                      ]
                    )
                  ),
                ),
                const Positioned(
                  left: 30,
                  top: 40,
                  child: Text(
                    'Black Friday',
                    style: headerBold,
                  )
                ),
                const Positioned(
                  left: 30,
                  top: 80,
                  child: Text(
                    'Pizza, dish of Italian origin consisting \nheated to a very high temperature—and served hot',
                    style: TextStyle(
                      fontSize: 13,
                      color: kDarkGreyFontColor
                    ),
                  )
                )
              ],
            )).toList(),
          ),
          Positioned(
            left: 30,
            bottom: 10,
            child: SmoothPageIndicator(
            controller: _pageController, 
            count: images.length,
            effect: const ExpandingDotsEffect(
              expansionFactor: 4,
              dotWidth: 6,
              dotHeight: 6,
              spacing: 4,
              activeDotColor: kLightFontColor
            ),
            onDotClicked: (index) {
              _pageController.animateToPage(
                index, 
                duration: const Duration(milliseconds: 300), 
                curve: Curves.easeInOut
              );
            },
            )
          )
        ],
      ),
    );
  }
}