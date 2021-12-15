import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/widgets/custom_appbar.dart';
import 'package:food_app/widgets/product/product_grid.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = '/ProductScreen';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightFontColor,
        body: Column(
          children: [
            CustomAppbar(
              leftIcon: Icons.arrow_back_ios_new_rounded,
              rightIcon: Icons.search_rounded,
              leftCallback: () => Navigator.of(context).pop(),
            ),
            const ProductGrid()
          ],
        ));
  }
}
