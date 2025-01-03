import 'package:flutter/material.dart';

import 'Authentication/auth_provider.dart';

class SplashProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = true;

  bool get isAuthenticated => _isAuthenticated;

  bool get isLoading => _isLoading;

  Future<void> initializeApp(AuthProvider authProvider) async {
    print("sjfsdfkjsfhksj");
    await authProvider.initializeFromLocalStorage();
    await Future.delayed(Duration(seconds: 3));

    if (authProvider.authToken != null) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    _isLoading = false;
    notifyListeners();
  }
}
