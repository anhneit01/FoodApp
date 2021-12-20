import 'package:flutter/material.dart';
import 'package:food_app/src/model/product.dart';
import 'package:food_app/src/service/reponsive/product_reponsive.dart';

class ProductViewModel extends ChangeNotifier {
  ProductReponsive _productReponsive = ProductReponsive();
  List<Product> _allProducts = [];
  bool _isLoading = false;

  List<Product> get allProducts => _allProducts;

  ProductViewModel() {
    loadProducts();
  }

  loadProducts() async {
    _isLoading = true;
    notifyListeners();
    List<Product> products = await _productReponsive.readProductData();
    _allProducts.addAll(products);
    _isLoading = true;
    notifyListeners();
  }
}