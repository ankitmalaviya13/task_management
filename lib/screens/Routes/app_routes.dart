part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN_SIGNUP = _Paths.LOGIN_SIGNUP;
  static const BOTTOMBAR = _Paths.BOTTOMBAR;
  static const VERIFYOTP = _Paths.VERIFYOTP;
  static const FORGOTPASSWORD = _Paths.FORGOTPASSWORD;
  static const RESETPASSWORD = _Paths.RESETPASSWORD;
  static const SIGNUP = _Paths.SIGNUP;
  static const RATING = _Paths.RATING;
  static const CHANGEPASSWORD = _Paths.CHANGEPASSWORD;
  static const EDITPROFILE = _Paths.EDITPROFILE;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/splash';
  static const LOGIN_SIGNUP = '/login-signup';
  static const BOTTOMBAR = '/bottomBar';
  static const VERIFYOTP = '/verifyOtp';
  static const FORGOTPASSWORD = '/forgotPassword';
  static const RESETPASSWORD = '/resetPassword';
  static const SIGNUP = '/signUp';
  static const RATING = '/rating';
  static const CHANGEPASSWORD = '/changePassword';
  static const EDITPROFILE = '/editProfile';
}
