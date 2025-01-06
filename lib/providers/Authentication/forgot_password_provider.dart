import 'package:get_it/get_it.dart';



import '../../model/forgot_password_model.dart';
import '../../screens/widgets/toast.dart';
import '../../services/Api/AuthApiService.dart';
import 'auth_provider.dart';

class ForgotPasswordProvider extends AuthProvider {
  final AuthApiService _authApiService = GetIt.instance<AuthApiService>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future forgotPassword(String email) async {
    setLoading(true);
    final response = await _authApiService.forgotPassword(
      data: {
        'email': email,
      },
    );
    print("Gdsflgdgkljhf");
    print(response);
    print(response.statusCode);
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
}
