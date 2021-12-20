import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_app/src/model/category.dart';

class CategoryReponsive {
  Future<List<Category>> readCategoryData() async{
    final jsonData = await rootBundle.loadString('assets/data/category.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Category.fromJSON(e)).toList();
  }
}