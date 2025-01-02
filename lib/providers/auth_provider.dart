import 'package:flutter/material.dart';

abstract class AuthProvider with ChangeNotifier {
  login(String username, String password) {}
  signup(String username, String password) {}
}

class LoginProvider extends AuthProvider {
  bool _obsecure = true;
  bool get obsecure => _obsecure;

  void togglePasswordVisibility() {
    _obsecure = !_obsecure;
    notifyListeners(); // Notify listeners to rebuild the widgets
  }
}

class SignUpProvider extends AuthProvider {
  bool _obsecure = true;
  bool _confirmpasswordobsecure = true;
  bool get obsecure => _obsecure;
  bool get confirmpasswordobsecure => _confirmpasswordobsecure;

  void togglePasswordVisibility() {
    _obsecure = !_obsecure;
    notifyListeners(); // Notify listeners to rebuild the widgets
  }

  void toggleConfirmPasswordVisibility() {
    _confirmpasswordobsecure = !_confirmpasswordobsecure;
    notifyListeners(); // Notify listeners to rebuild the widgets
  }
}
