import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_app/src/screens/base/base_view.dart';
import 'package:food_app/src/screens/detail.dart';
import 'package:food_app/src/view_models/product_view_model.dart';
import 'package:food_app/src/widgets/product/product_widget.dart';
import 'package:food_app/src/widgets/shimmer/shimmer_screen.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> with ProductWidget, ShimmerScreen {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
      model: ProductViewModel(),
      builder: (context, product, child) => StaggeredGridView.countBuilder(
        staggeredTileBuilder: (index) => StaggeredTile.count(3, index.isEven ? 3.4 : 3.6),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        crossAxisCount: 6,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          return product.isLoading ? buildProductGridShimmer(context)
          : GestureDetector(
            onTap: () => Navigator.pushNamed(context, DetailScreen.routeName, arguments: jsonEncode(product.allProducts.elementAt(index))),
            child: buildProductItemGrid(context, product.allProducts.elementAt(index)),
          );
        },
        shrinkWrap: true,
        itemCount: product.allProducts.length,
      ),
    );
  }
}