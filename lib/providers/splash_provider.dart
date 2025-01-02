import 'package:flutter/material.dart';

import '../core/constant/Localvariables.dart';
import '../services/Local/local_data_service.dart';

class SplashProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = true;

  bool get isAuthenticated => _isAuthenticated;

  bool get isLoading => _isLoading;

  Future<void> initializeApp() async {
    // Simulate any initialization process like checking authentication, loading configuration, etc.
    var token = await StorageService().getData(LocalVariables.authenticated);
    await Future.delayed(Duration(seconds: 3));

    print("Fsdfkjsdhfkdjsf");
    print(token);
    if (token != null) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    _isLoading = false;
    notifyListeners();
  }

  // Notify listeners that the app initialization is complete
}
