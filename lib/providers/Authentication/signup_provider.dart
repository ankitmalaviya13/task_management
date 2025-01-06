import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../core/device_helper/device_helper.dart';
import '../../model/signup_model.dart';
import '../../screens/widgets/toast.dart';
import '../../services/Api/auth_api_service.dart';

class SignUpProvider extends ChangeNotifier {
  final AuthApiService _authApiService = GetIt.instance<AuthApiService>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool check = false;

  onCheckbox(v) {
    check = v;
    notifyListeners();
  }

  Future signup(String email, String password, String firstName, String lastName) async {
    setLoading(true);
    Map<String, String?> deviceDetails = await LoginDeviceHelper.getLoginDeviceDetails();

    final response = await _authApiService.signup(
      data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'devicetoken': deviceDetails["deviceToken"],
        'deviceId': deviceDetails["deviceId"],
        'devicetype': deviceDetails["deviceType"],
      },
    );
    print("Gdsflgdgkljhf");
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      SignupModel data = SignupModel.fromJson(response.data);
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
