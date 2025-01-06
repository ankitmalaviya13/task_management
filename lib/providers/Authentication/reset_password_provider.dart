import 'package:get_it/get_it.dart';

import '../../core/device_helper/device_helper.dart';
import '../../model/reset_password_model.dart';
import '../../model/signup_model.dart';
import '../../screens/widgets/toast.dart';
import '../../services/Api/AuthApiService.dart';
import 'auth_provider.dart';

class ResetPasswordProvider extends AuthProvider {
  final AuthApiService _authApiService = GetIt.instance<AuthApiService>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future resetPassword(String email,String otp, String password) async {
    setLoading(true);
    print("fskfjhskfjsdh");
    print(password);
    Map<String, String?> deviceDetails = await LoginDeviceHelper.getLoginDeviceDetails();

    final response = await _authApiService.resetPassword(
      data: {
        'email': email,
        'otp': otp,
        'password': password,
      },
    );
    print("Gdsflgdgkljhf");
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      ResetPasswordModel data = ResetPasswordModel.fromJson(response.data);
      if (data.status == 1) {
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
