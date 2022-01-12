import 'package:flutter/material.dart';
import 'package:food_app/src/model/validation/validation_item.dart';

class AuthValidation extends ChangeNotifier {
  ValidationItem _email = ValidationItem(value: null, error: null);
  ValidationItem _password = ValidationItem(value: null, error: null);

  ValidationItem get email => _email;
  ValidationItem get password => _password;

  changeEmail(String value) {
    if(value.length >= 3) {
      _email = ValidationItem(value:  value, error: null);
    } else {
      _email = ValidationItem(value: null, error: "Must be at least 3 characters");
    }
    notifyListeners();
  }

  changePassword(String value) {
    if(value.length >= 3) {
      _password = ValidationItem(value:  value, error: null);
    } else {
      _password = ValidationItem(value: null, error: "Must be at least 1 characters");
    }
    notifyListeners();
  }
}