// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class PasswordProvider with ChangeNotifier {
  bool isPassword = true;
  bool get _isPassword => isPassword;
  void togglePasswordVisibilityLogin() {
    isPassword = !isPassword;
    notifyListeners();
  }

  bool isPasswordLogup = true;
  bool get _isPasswordLogup => isPasswordLogup;
  void togglePasswordVisibilityLogup() {
    isPasswordLogup = !isPasswordLogup;
    notifyListeners();
  }

  bool isRePasswordLogup = true;
  bool get _isRePasswordLogup => isRePasswordLogup;
  void toggleRePasswordVisibilityLogup() {
    isRePasswordLogup = !isRePasswordLogup;
    notifyListeners();
  }
}
