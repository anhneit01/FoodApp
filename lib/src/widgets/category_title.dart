import 'package:flutter/material.dart';
import 'package:food_app/theme/font_style.dart';

// ignore: must_be_immutable
class CategoryTitle extends StatelessWidget {
  String content;
  CategoryTitle({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(content, style: titleDark),
        ],
      ),
    );
  }
}
