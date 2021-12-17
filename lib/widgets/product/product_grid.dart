import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/api/product_api.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/screens/detail.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductApi.readProductData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text('${data.error}'));
        } else if (data.hasData) {
          var products = data.data as List<Product>;
          return buildProductGrid(context, products);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

Widget buildProductGrid(BuildContext context, List<Product> products) {
  return GridView.builder(
    shrinkWrap: true,
    itemCount: products.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.9,
      crossAxisSpacing: 0
    ),
    itemBuilder: (context, index) => GestureDetector(
      onTap: () => Navigator.pushNamed(context, DetailScreen.routeName, arguments: jsonEncode(products.elementAt(index))),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(20.0)
            ),
            width: 170.0,
            height: 200.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.all(9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    products.elementAt(index).image.toString(),
                    width: 85,
                    height: 85,
                  ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: Text(
                    products.elementAt(index).name.toString(),
                    style: nameProductDark,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      num.parse(products.elementAt(index).ratings.toString()).toInt(),
                      (index) => Image.asset('assets/images/ic_fillstar.png',
                          width: 12)),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${products.elementAt(index).duration.toString()} \nMin',
                      style: paragraph,
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      children: List.generate(
                          12,
                          (index) => Container(
                                width: 1.0,
                                height: 1.0,
                                color: kDarkGreyFontColor,
                              )),
                    ),
                    const Text(
                      'Hard \nLvl',
                      style: paragraph,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
