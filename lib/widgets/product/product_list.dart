import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/api/product_api.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/screens/detail.dart';
import 'package:food_app/screens/tab_cart.dart';

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
          return buildProductListItem(context, products);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

Widget buildProductListItem(BuildContext context, List<Product> products) {
  return ListView.builder(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, DetailScreen.routeName,
              arguments: jsonEncode(products.elementAt(index))),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    products.elementAt(index).image.toString(),
                    width: 100,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                products.elementAt(index).name.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: nameProduct,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        products.elementAt(index).desc.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: textDescription,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              "${products.elementAt(index).price.toString()} \$",
                              style: price,
                            ),
                          ),
                          GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, TabCart.routeName),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Image.asset(
                                  'assets/images/ic_shopping-bag.png',
                                  width: 50,
                                  height: 50,
                                  color: kBottomColor,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
    itemCount: products == null ? 0 : products.length,
  );
}
