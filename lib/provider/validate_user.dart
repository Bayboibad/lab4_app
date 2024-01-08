import 'package:flutter/material.dart';

class MyValidate with ChangeNotifier {
  RegExp expName = RegExp(r"<[^>]*>");
  RegExp expEmail = RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""");
  RegExp expPhone = RegExp(r"^\d+$");

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Vui lòng nhập email';
    } else if (!expEmail.hasMatch(email)) {
      return 'Vui lòng nhập email hợp lệ';
    }
    notifyListeners();
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    } else if (password.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    notifyListeners();
    return null;
  }
}
