import 'package:food_app/model/product.dart';

class Cart{
  final Product product;
  final int quantity;

  Cart({required this.product, required this.quantity});

  Cart.fromJSON(Map<String, dynamic> jsonData)
    : product = jsonData["product"],
    quantity = jsonData["quantity"];
}