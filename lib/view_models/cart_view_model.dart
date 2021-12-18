
import 'package:flutter/material.dart';
import 'package:food_app/model/cart.dart';
import 'package:food_app/model/product.dart';

class CartViewModel extends ChangeNotifier{
  List<Cart> _carts = [];

  int get totalCart => _totalCart();
  num get totalPrice => _totalPrice();
  List<Cart> get carts => _carts;

  addToCart(Product product) {
    int index = carts.indexWhere((element) => element.product.id == product.id);
    if(index > -1){
      carts[index] = Cart(
        product: product, 
        quantity: carts.elementAt(index).quantity + 1
      );
    } else {
      _carts.add(Cart(product: product, quantity:1));
    }
    notifyListeners();
  }

  updateCart(Cart cart, bool isPlus, {quantity = 1}){
    int _newQuantity = 1;
    if(quantity == 0){
      quantity = _newQuantity;
    }
    int index = carts.indexWhere((element) => element.product.id == cart.product.id);
    if(isPlus){
      _newQuantity = carts[index].quantity + 1;
    } else if (carts[index].quantity > 1){
      _newQuantity = carts[index].quantity - 1;
    }
    carts[index] = Cart(product: cart.product, quantity: _newQuantity);
    notifyListeners();
  } 

  removeCart(Cart cart){
    int index = carts.indexWhere((element) => element.product.id == cart.product.id);
    if(index > -1) {
      carts.removeAt(index);
    }
    notifyListeners();
  }

  int _totalCart() {
    return carts.fold(0, (previousValue, element) => previousValue + element.quantity);
  }
  num _totalPrice(){
    return carts.fold(0, (num currentTotal, Cart cart) => currentTotal + cart.quantity*cart.product.price!);
  }
}