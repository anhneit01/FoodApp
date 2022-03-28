import 'package:flutter/material.dart';
import 'package:food_app/src/model/validation/validation_item.dart';
import 'package:food_app/src/view_models/base/base_view_model.dart';

class AuthFormViewModel extends BaseViewModel {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValidationItem _email = ValidationItem(value: null, error: null);
  ValidationItem _password = ValidationItem(value: null, error: null);

  ValidationItem get email => _email;
  ValidationItem get password => _password;
  bool get obscureText => _obscureText;
  bool get isValid {
    if(_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }
  changeEmail(String value) {
    if(value.length >= 6 && value.contains('@')) {
      _email = ValidationItem(value:  value, error: null);
    } else {
      _email = ValidationItem(value: null, error: "Ten qua ngan hoac khong dung dinh dang");
    }
    notifyListeners();
  }

  changePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if(regex.hasMatch(value)) {
      _password = ValidationItem(value:  value, error: null);
    } else {
      _password = ValidationItem(value: null, error: "Must be at least 1 characters");
    }
    notifyListeners();
  }

  passwordToggle() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
  submit() {
    print(emailController.text);
    print(passwordController.text);
  }
}