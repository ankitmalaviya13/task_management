import 'package:get/get.dart';
import 'package:task_management/screens/bottomBar_Screen.dart';
import 'package:task_management/screens/login_view.dart';
import 'package:task_management/screens/splash_Screen.dart';
import 'package:task_management/screens/verify_otp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_SIGNUP;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const Splashscreen(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SIGNUP,
      page: () => const LoginView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBAR,
      page: () => const BottomBarScreen(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.VERIFYOTP,
      page: () => const VerifyOtpView(),
      // binding: SplashBinding(),
    ),
  ];
}
