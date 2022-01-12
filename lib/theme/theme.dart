// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_app/theme/color.dart';
ThemeData theme() => ThemeData(
  inputDecorationTheme: inputDecorationTheme(),
  fontFamily: 'Assistant',
);
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide(color: kBottomColor.withOpacity(0.4)),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 17,
      color: kDarkGreyColor.withOpacity(0.3),
      fontWeight: FontWeight.w600),
    labelStyle: TextStyle(
        fontSize: 18,
        color: kDarkGreyColor.withOpacity(0.6),
        fontWeight: FontWeight.w600),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 45, vertical: 25),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

class SocialCard extends StatelessWidget {
  const SocialCard({ Key? key, required this.icon, required this.press }) : super(key: key);
  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.all(12.0),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: kBorderColor.withOpacity(0.1),
        shape: BoxShape.circle
      ),
      child: Center(
        child: Image.asset(icon)
      ),
    );
  }
}