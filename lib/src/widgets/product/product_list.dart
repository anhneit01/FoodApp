import 'dart:convert';

import 'package:flutter/material.dart';
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
  ProductViewModel product = ProductViewModel();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    setLoading();
  }

  setLoading() async{
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {});
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductViewModel>(
      create: (_) => ProductViewModel(),
      child: Consumer<ProductViewModel>(builder: (context, product, child) {
        return SizedBox(
          height: 160.0,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return isLoading ? buildProductListShimmer(context, kDarkGreyColor, 350.0)
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
      },)
    );
  }
}

