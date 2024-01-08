import 'package:flutter/material.dart';

class PasswordProvider with ChangeNotifier{
   bool isPassword = true;
  bool get _isPassword => isPassword;
  void togglePasswordVisibilityLogin(){
    isPassword =! isPassword;
    notifyListeners();
  }
}