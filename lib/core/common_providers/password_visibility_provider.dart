import 'package:flutter/cupertino.dart';

enum PasswordField { loginPassword, signupPassword, signupConfirmPassword }

class PasswordVisibilityProvider with ChangeNotifier {
  final Map<String, bool> _visibilityMap = {};

  bool getVisibility(String fieldName) {
    return _visibilityMap[fieldName] ?? true;
  }

  void toggleVisibility(String fieldName) {
    _visibilityMap[fieldName] = !(_visibilityMap[fieldName] ?? true);
    notifyListeners();
  }
}
