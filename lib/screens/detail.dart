import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/widgets/custom_appbar.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/DetailScreen';
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Product? product;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var productString = ModalRoute.of(context)?.settings.arguments as String;
    var productJson = jsonDecode(productString);

    setState(() {
      product = Product.fromJSON(productJson);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbar(
              leftIcon: Icons.arrow_back_ios_new_rounded,
              rightIcon: Icons.favorite_rounded,
              leftCallback: () => Navigator.of(context).pop(),
            ),
            _buildProductImg(context, product!),
            _buildProductDetail(context, product!)
          ],
        ),
      ),
    );
  }
}

Widget _buildProductImg(BuildContext context, Product product) {
  return Container(
    height: 250,
    child: Stack(
      children: [
        Column(
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0)),
                    color: kBackground),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.all(15.0),
            width: 250.0,
            height: 250.0,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(-1, 10),
                blurRadius: 10,
              )
            ]),
            child: Image.asset(
              product.image.toString(),
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    ),
  );
}

Widget _buildProductDetail(BuildContext context, Product product) {
  return Container(
    padding: const EdgeInsets.all(25.0),
    color: kBackground,
    child: Column(
      children: [
        Text(
          product.name.toString(),
          style: title,
        ),
        const SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIconText(Icons.access_time_outlined, Colors.blue, '${product.duration.toString()} Min'),
            _buildIconText(Icons.star_outlined, Colors.amber, product.ratings.toString()),
            _buildIconText(Icons.local_fire_department, Colors.red, '50 Min')
          ],
        ),
        const SizedBox(height: 30.0),
        _buildProductQuantity(context, product),
        const SizedBox(height: 30.0),
        Row(
          children: [],
        )
      ],
    ),
  );
}

Widget _buildIconText(IconData icon, Color color, String text) {
  return Row(
    children: [
      Icon(
        icon,
        color: color,
        size: 20,
      ),
      Text(
        text,
        style: paragraph,
      )
    ],
  );
}

Widget _buildProductQuantity(BuildContext context, Product product) {
  return Container(
    width: double.maxFinite,
    height: 40,
    child: Stack(
      children: [
        Align(
          alignment: const Alignment(-0.3, 0),
          child: Container(
            height: double.maxFinite,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30.0)),
            child: Row(
              children: [
                const SizedBox(width: 15.0),
                const Text(
                  '\$',
                  style: textDark,
                ),
                Text(product.price.toString(), style: textDark),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.3, 0),
          child: Container(
            height: double.maxFinite,
            width: 120,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '-',
                  style: textDark,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Text('1', style: textDark),
                ),
                const Text(
                  '+',
                  style: textDark,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
