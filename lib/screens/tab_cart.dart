import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/widgets/custom_appbar.dart';
import 'package:food_app/widgets/product/product_grid.dart';

class TabCart extends StatelessWidget {
  static const routeName = '/TabCart';
  const TabCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDartColor,
      appBar: CustomAppbar(
        leftIcon: Icons.arrow_back_ios_new_rounded,
        rightIcon: Icons.favorite_rounded
      ),
      body: ProductGrid()
    );
  }
}
