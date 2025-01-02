import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _authToken = '';

  String get authToken => _authToken;

  Future<void> login(String username, String password) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    _authToken = 'dummyToken';
    notifyListeners();
  }

  Future<void> signup(String username, String password) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    _authToken = 'dummyToken';
    notifyListeners();
  }

  Future<void> resetPassword(String newPassword) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    notifyListeners();
  }
}
