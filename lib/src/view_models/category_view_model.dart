import 'package:flutter/material.dart';
import 'package:food_app/src/model/category.dart';
import 'package:food_app/src/service/reponsive/category_reponsive.dart';

class CategoryViewModel extends ChangeNotifier {
  CategoryReponsive _categoryReponsive = CategoryReponsive();
  List<Category> _allCategories = [];
  bool _isLoading = false;

  List<Category> get allCategories => _allCategories;

  CategoryViewModel() {
    loadCategories();
  }

  loadCategories() async {
    _isLoading = true;
    notifyListeners();
    List<Category> categories = await _categoryReponsive.readCategoryData();
    _allCategories.addAll(categories);
    _isLoading = true;
    notifyListeners();
  }
}