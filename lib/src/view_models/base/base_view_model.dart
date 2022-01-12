import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier{
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool loading) async{
    _isLoading = loading;
    notifyListeners();
  }

  initState() {}
  
}