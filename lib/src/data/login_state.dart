import 'package:flutter/material.dart';

class LoginState with ChangeNotifier {
  bool _loggedIn = false;

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }
}