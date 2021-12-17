import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/api/product_api.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/screens/detail.dart';
import 'package:food_app/view_models/cart_view_model.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductApi.readProductData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text('${data.error}'));
        } else if (data.hasData) {
          var products = data.data as List<Product>;
          return Container(
            height: 160.0,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, DetailScreen.routeName,
                        arguments: jsonEncode(products.elementAt(index))),
                    child: buildProductListItem(
                        context, products.elementAt(index)),
                  ),
                );
              },
              itemCount: products == null ? 0 : products.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

Widget buildProductListItem(BuildContext context, Product product) {
  return Container(
    padding: const EdgeInsets.all(15.0),
    width: 300.0,
    decoration: BoxDecoration(
      color: kDarkGreyColor,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Image.asset(
            product.image.toString(),
            width: 100,
            height: 100,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        product.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: nameProductWhite,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Text(
                product.desc.toString(),
                overflow: TextOverflow.ellipsis,
                style: paragraph,
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      "${product.price.toString()} \$",
                      style: price,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.read<CartViewModel>().addToCart(product),
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: const BoxDecoration(
                        color: kBackground,
                        shape: BoxShape.circle
                      ),
                      child: Image.asset(
                        'assets/images/ic_cart.png',
                        width: 25,
                        height: 25,
                        color: kDartColor,
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
