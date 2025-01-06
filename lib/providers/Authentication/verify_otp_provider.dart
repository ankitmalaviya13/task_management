import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../model/forgot_password_model.dart';
import '../../model/verify_otp_model.dart';
import '../../screens/widgets/toast.dart';
import '../../services/Api/auth_api_service.dart';
import 'auth_provider.dart';

class VerifyOtpProvider extends ChangeNotifier {
  final _email;
  final _pass_req;

  VerifyOtpProvider(this._email, this._pass_req);
  final authProvider = GetIt.instance<AuthProvider>();

  final AuthApiService _authApiService = GetIt.instance<AuthApiService>();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String get email => _email;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future resendOtp() async {
    setLoading(true);

    final response = await _authApiService.resendOtp(
      data: {
        'email': _email,
      },
    );
    print("Gdsflgdgkljhf");
    print(response);
    if (response.statusCode == 200) {
      print(response.data);
      ForgotPasswordModel data = ForgotPasswordModel.fromJson(response.data);
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

  Future verifyOtp(String otp) async {
    setLoading(true);
    final response = await _authApiService.verifyOtp(
      data: {
        'email': _email,
        'pass_req': _pass_req,
        'otp': otp,
      },
    );
    print("Gdsflgdgkljhf");
    print(response);
    if (response.statusCode == 200) {
      print(response.data);
      VerifyOtpModel data = VerifyOtpModel.fromJson(response.data);
      if (data.status == 1) {
        if (_pass_req == 0 || _pass_req == 1) {
          await authProvider.loggedIn(
            token: data.userToken ?? '',
            userId: data.info?.id ?? "",
            email: data.info?.email ?? "",
            firstName: data.info?.firstName ?? "",
            lastName: data.info?.lastName ?? "",
            profilePic: data.info?.profilepic ?? "",
          );
          Toasty.showtoast(data.message.toString());
          setLoading(false);
          return null;
        } else {
          Toasty.showtoast(data.message.toString());
          setLoading(false);
          return 2;
        }
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
