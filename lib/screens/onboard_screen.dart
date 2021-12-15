import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:food_app/screens/home_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/shape.png',
                  )),
              Positioned(
                  top: 50.0,
                  right: 50.0,
                  child: Image.asset('assets/images/bugger(1).png'))
            ],
          ),
          Positioned(
            bottom: 28.5,
            right: 30.0,
            left: 30.0,
            child: Container(
              height: 330.0,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: kDartColor,
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: const [
                    BoxShadow(offset: Offset(0, 8), blurRadius: 4.0)
                  ]),
              child: Column(
                children: [
                  const SizedBox(height: 28.0),
                  const Text('Simplify your \ncooking plan', style: headerBold),
                  const SizedBox(height: 24.0),
                  const Text('No more confused about \nyour meal menu',
                      textAlign: TextAlign.center, style: paragraph),
                  const SizedBox(height: 28.0),
                  // ignore: avoid_unnecessary_containers
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),
                    child: Container(
                      height: 52.0,
                      width: 230.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Text(
                        "Let's go".toUpperCase(),
                        style: textDark,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
