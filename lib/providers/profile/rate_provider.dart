import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:task_management/services/Api/profile_api_service.dart';

import '../../model/logout_model.dart';
import '../../screens/widgets/toast.dart';
import '../Authentication/auth_provider.dart';

class RateProvider extends ChangeNotifier {
  final ProfileApiService _profileApiService = GetIt.instance<ProfileApiService>();
  final authProvider = GetIt.instance<AuthProvider>();
  bool _isLoading = false;
  int _rate = 0;

  int get rate => _rate;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setRate(int value) {
    _rate = value;
    notifyListeners();
  }

  Future addRate(String rateText) async {
    setLoading(true);

    final response = await _profileApiService.addRate(
      data: {'rate': _rate, 'rateText': rateText},
      headers: {'Authorization': '${authProvider.authToken}'},
    );
    print("Gdsflgdgkljhf");
    print(response);
    if (response.statusCode == 200) {
      print(response.data);
      LogoutModel data = LogoutModel.fromJson(response.data);
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
