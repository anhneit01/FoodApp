import 'package:flutter/material.dart';
import 'package:food_app/src/screens/home_screen.dart';
import 'package:food_app/theme/color.dart';
import 'package:food_app/theme/font_style.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/SearchScreen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: getAppBar());
  }
}

// ignore: camel_case_types
class getAppBar extends StatelessWidget implements PreferredSize {
  const getAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).popAndPushNamed(HomeScreen.routeName),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kBottomColor,
            )
          ),
          Expanded(
            child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: kWhiteColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(width: 0.5, color: kDarkColor)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
              prefixIcon: IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.search_rounded)
              ),
              hintText: 'Search hear....',
              hintStyle: paragraphDark,
              suffixIcon: IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.clear),
              )
            ),
          )),
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}