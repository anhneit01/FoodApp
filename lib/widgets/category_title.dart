import 'package:flutter/material.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:food_app/screens/product.dart';

// ignore: must_be_immutable
class CategoryTitle extends StatelessWidget {
  String content;
  CategoryTitle({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(content, style: title),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, ProductScreen.routeName),
            child: const Text(
              'See all',
              style: paragraph,
            ),
          )
        ],
      ),
    );
  }
}
