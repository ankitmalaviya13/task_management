import 'package:get/get.dart';
import 'package:task_management/screens/bottom_bar_view.dart';
import 'package:task_management/screens/change_password_view.dart';
import 'package:task_management/screens/edit_profile_view.dart';
import 'package:task_management/screens/forgot_password_view.dart';
import 'package:task_management/screens/home_view.dart';
import 'package:task_management/screens/login_view.dart';
import 'package:task_management/screens/project_view.dart';
import 'package:task_management/screens/rating_view.dart';
import 'package:task_management/screens/reset_password_view.dart';
import 'package:task_management/screens/sign_up_view.dart';
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
      name: _Paths.SIGNUP,
      page: () => const SignUpView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBAR,
      page: () => BottomBarScreen(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.VERIFYOTP,
      page: () => VerifyOtpView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => const ForgotPasswordView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => const ResetPasswordView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.RATING,
      page: () => RatingView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASSWORD,
      page: () => ChangePasswordView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => EditProfileView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT,
      page: () => ProjectView(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      // binding: SplashBinding(),
    ),
  ];
}
