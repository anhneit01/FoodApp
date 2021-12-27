// ignore_for_file: prefer_final_fields

import 'package:food_app/src/model/product.dart';
import 'package:food_app/src/service/reponsive/product_reponsive.dart';
import 'package:food_app/src/view_models/base/base_list_view_model.dart';

class ProductViewModel extends BaseListViewModel {
  ProductReponsive _productReponsive = ProductReponsive();
  List<Product> _allProducts = [];

  List<Product> get allProducts => _allProducts;

  ProductViewModel() {
    loadProducts();
  }
  
  loadProducts() async {
    List<Product> products = await _productReponsive.readProductData();
    _allProducts.addAll(products);
    notifyListeners();
  }

  @override
  Future<void> onLoading() async {
    List<Product> products = await _productReponsive.readProductData();
    _allProducts.addAll(products);
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh() async {
    _allProducts = [];
    List<Product> products = await _productReponsive.readProductData();
    _allProducts.addAll(products);
    refreshController.refreshCompleted();
  }
}