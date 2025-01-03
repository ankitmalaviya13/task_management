class AppUrl {
  AppUrl._();

  static const String baseUrl = "http://192.168.29.28:8585/";
  static const String imagebaseUrl = "";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(minutes: 2);

  // connectTimeout
  static const Duration connectionTimeout = Duration(minutes: 2);

  static const String login = 'api/user/login';
  static const String signUp = 'api/user';
  static const String verifyOtp = 'api/user/verifyOtp';
  static const String logOut = 'api/user/logout';
  static const String RateUs = 'api/rate';
}
