import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/src/model/product.dart';
import 'package:food_app/src/view_models/cart_view_model.dart';
import 'package:food_app/src/widgets/custom_appbar.dart';
import 'package:food_app/theme/color.dart';
import 'package:food_app/theme/font_style.dart';
import 'package:provider/provider.dart';

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
                rightIcon: Icons.favorite_border_rounded,
                leftCallback: () => Navigator.of(context).pop(),
              ),
              _buildProductImg(context, product!),
              buildProductDetail(context, product!)
            ],
          ),
        ),
        floatingActionButton: buildFloatingButton(context, product!));
  }
}

Widget _buildProductImg(BuildContext context, Product product) {
  return SizedBox(
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
                    color: kWhiteColor),
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
                offset: const Offset(-1, 10),
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

Widget buildProductDetail(BuildContext context, Product product) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    color: kWhiteColor,
    child: Column(
      children: [
        Text(product.name.toString(), style: titleDark),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildIconText(Icons.access_time_outlined, Colors.blue,
                '${product.duration.toString()} Min'),
            buildIconText(
                Icons.star_outlined, Colors.amber, product.ratings.toString()),
            buildIconText(Icons.local_fire_department, Colors.red, '50 Min')
          ],
        ),
        const SizedBox(height: 30.0),
        buildProductQuantity(context, product),
        const SizedBox(height: 40.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description',
              maxLines: 5,
              style: nameDark,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(product.desc.toString(),
                  style: const TextStyle(
                    wordSpacing: 1.2,
                    height: 1.5,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kBorderColor,
                  )),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildIconText(IconData icon, Color color, String text) {
  return Row(
    children: [
      Icon(
        icon,
        color: color,
        size: 20,
      ),
      Text(
        text,
        style: const TextStyle(
            fontSize: 15, color: kBorderColor, fontWeight: FontWeight.w600),
      )
    ],
  );
}

Widget buildProductQuantity(BuildContext context, Product product) {
  return SizedBox(
    width: double.maxFinite,
    height: 50,
    child: Stack(
      children: [
        Align(
          alignment: const Alignment(-0.3, 0),
          child: Container(
            height: double.maxFinite,
            width: 170,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30.0)),
            child: Row(
              children: [
                const SizedBox(width: 15.0),
                const Text('\$', style: currencyUnit),
                Text(product.price.toString(), style: price)
              ],
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0.3, 0),
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
                  style: nameDark,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Text('1', style: nameDark),
                ),
                const Text(
                  '+',
                  style: nameDark,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildFloatingButton(BuildContext context, Product product) {
  return SizedBox(
    width: 95,
    height: 60,
    child: RawMaterialButton(
      fillColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      elevation: 2.0,
      onPressed: () {},
      child: Row(
        children: [
          IconButton(
              onPressed: () => context.read<CartViewModel>().addToCart(product),
              icon: Image.asset(
                'assets/images/ic_bag.png',
                width: 30,
              )),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Text(context.watch<CartViewModel>().totalCart.toString(),
                style: nameDark),
          ),
        ],
      ),
    ),
  );
}
