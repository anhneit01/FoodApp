import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_app/src/model/product.dart';

class ProductReponsive {
  Future<List<Product>> readProductData() async{
    final jsonData = await rootBundle.loadString('assets/data/product.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Product.fromJSON(e)).toList();
  }
}