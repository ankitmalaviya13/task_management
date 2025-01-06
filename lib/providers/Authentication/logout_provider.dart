import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../model/logout_model.dart';
import '../../screens/widgets/toast.dart';
import '../../services/Api/auth_api_service.dart';
import 'auth_provider.dart';

class LogoutProvider extends ChangeNotifier {
  final AuthApiService _authApiService = GetIt.instance<AuthApiService>();
  final authProvider = GetIt.instance<AuthProvider>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future logOut() async {
    setLoading(true);
    print("fsdjfgsdjkfhsfkhs");
    print(authProvider.authToken);
    final response = await _authApiService.logOut(
      headers: {'Authorization': '${authProvider.authToken}'},
    );
    print("Gdsflgdgkljhf");
    print(response);
    print(response.statusCode);
    print(response.statusMessage);
    if (response.statusCode == 200) {
      print(response.data);
      LogoutModel data = LogoutModel.fromJson(response.data);
      if (data.status == 1) {
        authProvider.logOutlocal();
        setLoading(false);
        return null;
      } else {
        authProvider.logOutlocal();
        setLoading(false);
        Toasty.showtoast(data.message.toString());
        return null;
      }
    } else {
      authProvider.logOutlocal();
      setLoading(false);
      Toasty.showtoast(response.statusMessage.toString());
      return response.statusMessage.toString();
    }
  }
}
