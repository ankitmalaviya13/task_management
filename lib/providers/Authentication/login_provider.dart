import 'package:get_it/get_it.dart';
import 'package:task_management/services/Api/AuthApiService.dart';

import '../../core/device_helper/device_helper.dart';
import '../../model/login_model.dart';
import '../../screens/widgets/toast.dart';
import 'auth_provider.dart';

class LoginProvider extends AuthProvider {
  final AuthApiService _authApiService = GetIt.instance<AuthApiService>();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future login(String email, String password) async {
    setLoading(true);
    Map<String, String?> deviceDetails = await LoginDeviceHelper.getLoginDeviceDetails();

    final response = await _authApiService.login(
      data: {
        'email': email,
        'password': password,
        'devicetoken': deviceDetails["deviceToken"],
        'deviceId': deviceDetails["deviceId"],
        'devicetype': deviceDetails["deviceType"],
      },
    );
    if (response.statusCode == 200) {
      print(response.data);
      LoginModel data = LoginModel.fromJson(response.data);
      if (data.status == 1) {
        await loggedIn(
          token: data.userToken ?? '',
          userId: data.user?.id ?? "",
          email: data.user?.email ?? "",
          firstName: data.user?.firstName ?? "",
          lastName: data.user?.lastName ?? "",
          profilePic: data.user?.profilepic ?? "",
        );

        setLoading(false);
        return null;
      } else {
        setLoading(false);
        return data.message.toString();
      }
    } else {
      setLoading(false);
      Toasty.showtoast(response.statusMessage.toString());
    }

    return "";
  }
}
