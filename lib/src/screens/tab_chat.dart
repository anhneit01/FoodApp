import 'package:flutter/material.dart';
import 'package:food_app/src/screens/home_screen.dart';
import 'package:food_app/src/widgets/custom_appbar.dart';

class TabChat extends StatelessWidget {
  static const routeName = '/TabChat';
  const TabChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leftIcon: Icons.arrow_back_ios_new_rounded,
        rightIcon: Icons.more_vert,
        leftCallback: () => Navigator.of(context).popAndPushNamed(HomeScreen.routeName),
      ),
    );
  }
}
