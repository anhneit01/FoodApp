import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/src/screens/base/base_view.dart';
import 'package:food_app/src/screens/detail.dart';
import 'package:food_app/src/view_models/product_view_model.dart';
import 'package:food_app/src/widgets/product/product_widget.dart';
import 'package:food_app/src/widgets/shimmer/shimmer_screen.dart';
import 'package:food_app/theme/color.dart';
import 'package:food_app/theme/font_style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/SearchScreen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with ProductWidget, ShimmerScreen {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          backgroundColor: kWhiteColor,
          elevation: 0.0,
          title: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: kDarkGreyColor,
                    )),
                hintText: 'Search....',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.clear),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: kBottomColor,
                    )),
              ),
            ),
          ),
        ),
        backgroundColor: kWhiteColor,
        body: BaseView<ProductViewModel>(
          model: ProductViewModel(),
          builder: (context, product, child) {
            return SmartRefresher(
              enablePullUp: true,
              enablePullDown: true,
              controller: product.refreshController,
              onLoading: product.onLoading,
              onRefresh: product.onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return product.isLoading
                      ? buildProductListShimmer(
                          context,
                          kLightWhiteColor.withOpacity(0.3),
                          MediaQuery.of(context).size.width)
                      : Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0),
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, DetailScreen.routeName,
                                arguments: jsonEncode(
                                    product.allProducts.elementAt(index))),
                            child: buildProductItemList(
                                context,
                                product.allProducts.elementAt(index),
                                kLightWhiteColor.withOpacity(0.3),
                                MediaQuery.of(context).size.width,
                                nameDark),
                          ),
                        );
                },
                itemCount: product.allProducts.length,
              ),
            );
          },
        ));
  }
}
