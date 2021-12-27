import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_app/src/screens/detail.dart';
import 'package:food_app/src/view_models/product_view_model.dart';
import 'package:food_app/src/widgets/product/product_widget.dart';
import 'package:food_app/src/widgets/shimmer/shimmer_screen.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> with ProductWidget, ShimmerScreen {
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
      child: Consumer<ProductViewModel>(
        builder: (context, product, child) {
          return StaggeredGridView.countBuilder(
            staggeredTileBuilder: (index) => StaggeredTile.count(3, index.isEven ? 3.4 : 3.6),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            crossAxisCount: 6,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemBuilder: (context, index) {
              return isLoading ? buildProductGridShimmer(context)
              : GestureDetector(
                onTap: () => Navigator.pushNamed(context, DetailScreen.routeName, arguments: jsonEncode(product.allProducts.elementAt(index))),
                child: buildProductItemGrid(context, product.allProducts.elementAt(index)),
              );
            },
            shrinkWrap: true,
            itemCount: product.allProducts.length,
          );
        },
      ),
    );
  }
}