import 'package:get_it/get_it.dart';

import '../../core/device_helper/device_helper.dart';
import '../../model/logout_model.dart';
import '../../model/reset_password_model.dart';
import '../../model/signup_model.dart';
import '../../screens/widgets/toast.dart';
import '../../services/Api/AuthApiService.dart';
import 'auth_provider.dart';

class LogoutProvider extends AuthProvider {
  final AuthApiService _authApiService = GetIt.instance<AuthApiService>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future logOut() async {
    setLoading(true);
    print("fsdjfgsdjkfhsfkhs");
    print(authToken);
    final response = await _authApiService.logOUt(
      headers: {'Authorization': 'Bearer ${authToken}'},
    );
    print("Gdsflgdgkljhf");
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      LogoutModel data = LogoutModel.fromJson(response.data);
      if (data.status == 1) {
        logOutlocal();
        setLoading(false);
        return null;
      } else {
        setLoading(false);
        Toasty.showtoast(data.message.toString());
        return data.message.toString();
      }
    } else {
      setLoading(false);
      Toasty.showtoast(response.statusMessage.toString());
      return response.statusMessage.toString();
    }
  }
}
