import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/src/screens/base/base_view.dart';
import 'package:food_app/src/screens/detail.dart';
import 'package:food_app/src/view_models/product_view_model.dart';
import 'package:food_app/src/widgets/product/product_widget.dart';
import 'package:food_app/src/widgets/shimmer/shimmer_screen.dart';
import 'package:food_app/theme/color.dart';
import 'package:food_app/theme/font_style.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> with ProductWidget, ShimmerScreen{
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
      model: ProductViewModel(), 
      builder: (context, product, child) {
        return SizedBox(
          height: 160.0,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return product.isLoading ? buildProductListShimmer(context, kDarkGreyColor, 350.0)
              : Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, DetailScreen.routeName,
                      arguments: jsonEncode(product.allProducts.elementAt(index))),
                  child: buildProductItemList(context, product.allProducts.elementAt(index), kDarkGreyColor, 300.0, nameLight),
                ),
              );
            },
            itemCount: product.allProducts.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}

