import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/src/screens/detail.dart';
import 'package:food_app/src/view_models/product_view_model.dart';
import 'package:food_app/src/widgets/product/product_widget.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> with ProductWidget {
  ProductViewModel product = ProductViewModel();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductViewModel>(
      create: (_) => ProductViewModel(),
      child: Consumer<ProductViewModel>(
        builder: (context, product, child) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              mainAxisSpacing: 20,
            ), 
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, DetailScreen.routeName, arguments: jsonEncode(product.allProducts.elementAt(index))),
              child: buildProductItemGrid(context, product.allProducts.elementAt(index)),
            ),
            shrinkWrap: true,
            itemCount: product.allProducts.length,
          );
        },
      ),
    );
  }
}