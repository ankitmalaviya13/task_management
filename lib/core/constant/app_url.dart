class AppUrl {
  AppUrl._();

  // base url
  static const String baseUrl = "http://192.168.29.28:8585";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(minutes: 2);

  // connectTimeout
  static const Duration connectionTimeout = Duration(minutes: 2);

  static const String login = '/api/user/login';
}
