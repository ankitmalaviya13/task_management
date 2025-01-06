import 'package:flutter/material.dart';

import '../../core/constant/Localvariables.dart';
import '../../services/Local/local_data_service.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _authToken;
  String? _userId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _profilePic;

  // Getters for accessing data
  bool get isAuthenticated => _isAuthenticated;
  String? get authToken => _authToken;
  String? get userId => _userId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get profilePic => _profilePic;

  // Initialize data from local storage
  Future<void> initializeFromLocalStorage() async {
    print("fdskfjhsdfksfjkd");
    _authToken = await StorageService().getData(LocalVariables.token);
    _userId = await StorageService().getData(LocalVariables.userId);
    _firstName = await StorageService().getData(LocalVariables.firstName);
    _lastName = await StorageService().getData(LocalVariables.lastName);
    _email = await StorageService().getData(LocalVariables.email);
    _profilePic = await StorageService().getData(LocalVariables.profilePic);
    _isAuthenticated = _authToken != null && _authToken!.isNotEmpty;
    print(_authToken);
    notifyListeners();
  }

  // Log in method
  Future<void> loggedIn({
    required String token,
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required String profilePic,
  }) async {
    _isAuthenticated = true;
    _authToken = token;
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _profilePic = profilePic;
    print("fdsiufsdhyfksfksdjfh");
    print(token);
    await StorageService().saveData(LocalVariables.token, token);
    await StorageService().saveData(LocalVariables.userId, userId);
    await StorageService().saveData(LocalVariables.firstName, firstName);
    await StorageService().saveData(LocalVariables.lastName, lastName);
    await StorageService().saveData(LocalVariables.email, email);
    await StorageService().saveData(LocalVariables.profilePic, profilePic);

    notifyListeners();
  }

  // Log out method
  Future<void> logOutlocal() async {
    _isAuthenticated = false;
    _authToken = null;
    _userId = null;
    _firstName = null;
    _lastName = null;
    _email = null;
    _profilePic = null;

    await StorageService().removeData(LocalVariables.token);
    await StorageService().removeData(LocalVariables.userId);
    await StorageService().removeData(LocalVariables.firstName);
    await StorageService().removeData(LocalVariables.lastName);
    await StorageService().removeData(LocalVariables.email);
    await StorageService().removeData(LocalVariables.profilePic);

    notifyListeners();
  }
}
