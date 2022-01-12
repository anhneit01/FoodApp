import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  Future<void> login() async {
    _isLogin = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isLogin', true);
    notifyListeners();
  } 

  Future<void> logout() async {
    _isLogin = false;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isLogin', false);
    notifyListeners();
  }

  Future<void> tryLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _isLogin = preferences.getBool('isLogin')!;
    notifyListeners();
  }
}