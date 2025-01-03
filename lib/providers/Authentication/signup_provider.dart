import 'auth_provider.dart';

class SignUpProvider extends AuthProvider {
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

  Future<void> login(String username, String password) async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 2));
    setLoading(false);
    // Implement login logic here
  }
}
