part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN_SIGNUP = _Paths.LOGIN_SIGNUP;
  static const BOTTOMBAR = _Paths.BOTTOMBAR;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/splash';
  static const LOGIN_SIGNUP = '/login-signup';
  static const BOTTOMBAR = '/bottomBar';
}
