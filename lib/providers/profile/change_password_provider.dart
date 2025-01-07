import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../core/device_helper/device_helper.dart';
import '../../model/signup_model.dart';
import '../../screens/widgets/toast.dart';
import '../../services/Api/auth_api_service.dart';
import '../../services/Api/profile_api_service.dart';
import '../Authentication/auth_provider.dart';

class ChangePasswordProvider extends ChangeNotifier {
  final ProfileApiService _profileApiService = GetIt.instance<ProfileApiService>();
  final authProvider = GetIt.instance<AuthProvider>();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


  Future changePassword( String oldPassword, String newPassword) async {
    setLoading(true);
    final response = await _profileApiService.changePassword(
      data: {
        "oldpassword":oldPassword,
        "newpassword":newPassword
      },
      headers: {'Authorization': '${authProvider.authToken}'},
    );
    print("Gdsflgdgkljhf");
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      SignupModel data = SignupModel.fromJson(response.data);
      if (data.status == 1) {
        setLoading(false);
        Toasty.showtoast(data.message.toString());
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
