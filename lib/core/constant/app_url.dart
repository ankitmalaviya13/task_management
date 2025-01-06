class AppUrl {
  AppUrl._();

  // base url
  static const String baseUrl = "http://192.168.0.3:8585";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(minutes: 2);

  // connectTimeout
  static const Duration connectionTimeout = Duration(minutes: 2);

  static const String login = '/api/user/login';
  static const String signup = '/api/user';
  static const String forgetpassword = '/api/user/forgetpassword';
  static const String verifyOtp = '/api/user/verifyOtp';
  static const String resetPassword = '/api/user/resetPassword';
  static const String logout = '/api/user/logout';

}
