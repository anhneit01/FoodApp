// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({ Key? key, required this.text, required this.onClicked }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onClicked,
      color: kPrimaryColor,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Text(
        text,
        style: title,
      ),
    );
  }
}