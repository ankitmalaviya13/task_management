import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/Apis/loginSignupApis.dart';
import 'package:task_management/core/DeviceInfo/device_info.dart';
import 'package:task_management/core/Models/ForgotModel.dart';
import 'package:task_management/core/Models/ResetPasswordModel.dart';
import 'package:task_management/core/Models/SignUpModel.dart';
import 'package:task_management/core/Models/VerifyModel.dart';
import 'package:task_management/core/Models/loginModel.dart';
import 'package:task_management/core/constant/constant.dart';

import '../Routes/app_pages.dart';

class LoginSignupController extends GetxController {
  LoginSignupApi loginSignupApi = LoginSignupApi();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  final forgotFormKey = GlobalKey<FormState>();
  final resetFormKey = GlobalKey<FormState>();
  final forgotPinKey = GlobalKey<FormState>();

  RxBool isLoginLoading = false.obs;
  RxBool isSignupLoading = false.obs;
  RxBool isVerifyPinLoading = false.obs;
  RxBool isForgotLoading = false.obs;
  RxBool isForgotPinLoading = false.obs;
  RxBool isResetLoading = false.obs;
  RxBool obSecurePassword = true.obs;
  RxBool obSecureConfirmPassword = true.obs;
  RxBool isResend = false.obs;
  RxInt passReq = 1.obs;

  storedata({token, userId, email, firstName, lastName}) {
    box.write(ConstantsVariables.token, token);
    box.write(ConstantsVariables.userId, userId);
    box.write(ConstantsVariables.email, email);
    box.write(ConstantsVariables.firstName, firstName);
    box.write(ConstantsVariables.lastName, lastName);
  }

  loginApi() async {
    var requestData = {
      'email': emailController.text,
      'password': passwordController.text,
      "devicetoken": ConstantsVariables.deviceToken,
      "deviceId": DeviceInfo.deviceId,
      "devicetype": DeviceInfo.deviceType,
    };
    print(requestData);
    isLoginLoading.value = true;
    final response = await loginSignupApi.login(data: requestData);
    if (response.statusCode == 200) {
      print(response.data);
      LoginModel data = LoginModel.fromJson(response.data);
      box.write(ConstantsVariables.token, data.userToken ?? "");
      print("Stored Token: ${ConstantsVariables.token}");
      print("Token");
      print(data.userToken);
      if (data.status == true) {
        storedata(
          userId: data.user.id ?? '',
          email: data.user.email ?? '',
          firstName: data.user.firstName ?? '',
          lastName: data.user.lastName ?? '',
          token: data.userToken ?? "",
        );
      } else {
        isLoginLoading.value = false;
        Toasty.showtoast(data.message.toString());
        Get.toNamed(Routes.BOTTOMBAR);
      }
    } else {
      isLoginLoading.value = false;
      Toasty.showtoast(response.statusMessage.toString());
    }
  }

  signupApi() async {
    isSignupLoading.value = true;
    var jsonData = {
      "email": emailController.text,
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "password": passwordController.text,
      "devicetoken": ConstantsVariables.deviceToken,
      "deviceId": DeviceInfo.deviceId,
      "devicetype": DeviceInfo.deviceType,
    };
    print(jsonData);
    final response = await loginSignupApi.signUp(data: jsonData);
    if (response.statusCode == 200) {
      SignUpModel data = SignUpModel.fromJson(response.data);
      if (data.status == true) {
      } else {
        isLoginLoading.value = false;
        Toasty.showtoast('${data.message} OTP: ${data.otp}');
        Get.toNamed(Routes.VERIFYOTP);
      }
    } else {
      isLoginLoading.value = false;
      Toasty.showtoast(response.statusMessage.toString());
    }
  }

  onTapWelcomeSignup() {
    passReq = 0.obs;
    Get.toNamed(Routes.SIGNUP);
  }

  onTapWelcomeLogin() {
    passReq = 1.obs;
    Get.toNamed(Routes.LOGIN_SIGNUP);
  }

  onTapWelcomeResetPassword() {
    passReq = 2.obs;
    Get.toNamed(Routes.FORGOTPASSWORD);
  }

  verifyOtp() async {
    isVerifyPinLoading.value = true;

    final response = await loginSignupApi.verifyOtp(
      data: {
        'email': emailController.text,
        'pass_req': passReq.value,
        'otp': otpController.text,
      },
    );

    print(response);
    print("PASS REQ VALUE");
    print(passReq.value);
    if (response.statusCode == 200) {
      VerifyModel data = VerifyModel.fromJson(response.data);
      if (data.status == 1) {
        isVerifyPinLoading.value = false;
        if (passReq.value == 2) {
          Get.toNamed(Routes.RESETPASSWORD);
        } else {
          Get.offAllNamed(Routes.BOTTOMBAR);
        }
      } else {
        isVerifyPinLoading.value = false;
        Toasty.showtoast(data.message.toString());
      }
    } else {
      isVerifyPinLoading.value = false;
      Toasty.showtoast(response.statusMessage.toString());
    }
  }

  // verifyOtp() async {
  //   isVerifyPinLoading.value = true;
  //   final response = await loginSignupApi.verifyOtp(
  //     data: {
  //       'email': emailController.text,
  //       'pass_req': passReq.value,
  //       'otp': otpController.text,
  //     },
  //   );
  //   print(response);
  //   print("PASS REQ VALUE");
  //   print(passReq.value);
  //   if (response.statusCode == 200) {
  //     VerifyModel data = VerifyModel.fromJson(response.data);
  //     if (data.status == true) {
  //       isVerifyPinLoading.value = false;
  //     } else {
  //       isVerifyPinLoading.value = false;
  //       Toasty.showtoast(data.message.toString());
  //     }
  //   } else {
  //     isVerifyPinLoading.value = false;
  //     Toasty.showtoast(response.statusMessage.toString());
  //   }
  // }

  forgotPassword() async {
    isForgotLoading.value = true;
    isForgotPinLoading.value = true;

    final response = await loginSignupApi.forgotPassword(
      data: {
        'email': emailController.text,
      },
    );

    if (response.statusCode == 200) {
      ForgotModel data = ForgotModel.fromJson(response.data);
      if (data.status == true) {
        isForgotLoading.value = false;
        isForgotPinLoading.value = false;
        Get.toNamed(Routes.VERIFYOTP)?.then((value) {
          if (value != null) {
            Get.back(result: value);
          }
        });
      } else {
        isForgotLoading.value = false;
        isForgotPinLoading.value = false;
        Toasty.showtoast(data.message.toString());
        Get.toNamed(Routes.VERIFYOTP);
      }
      if (isResend.value == true) {
        Toasty.showtoast("Resend Code Successfully");
        otpController.clear();
      }
    } else {
      isForgotLoading.value = false;
      isForgotPinLoading.value = false;
      Toasty.showtoast(response.statusMessage.toString());
    }
  }

  ResetPassword() async {
    isResetLoading.value = true;
    final response = await loginSignupApi.resetPassword(
      data: {
        'email': emailController.text,
        'password': passwordController.text,
        'otp': otpController.text,
      },
    );

    isResetLoading.value = false;

    if (response.statusCode == 200) {
      final data = ChangePasswordModel.fromJson(response.data);
      if (data.status == true) {
        Get.toNamed(Routes.BOTTOMBAR);
        // showSuccessDialog(
        //   title: "Password Changed Successfully",
        //   subtext: data.message ?? "You can now log in with your new password.",
        // );
        // await Future.delayed(const Duration(seconds: 2));
      } else {
        Toasty.showtoast(data.message ?? "Password Changed Successfully");
        Get.toNamed(Routes.BOTTOMBAR);
      }
    } else {
      Toasty.showtoast(response.statusMessage ?? "An error occurred.");
    }
  }

  onTapLogin() async {
    if (loginFormKey.currentState!.validate()) {
      loginApi();
    }
  }

  onTapSignUp() async {
    if (signUpFormKey.currentState!.validate()) {
      signupApi();
    }
  }

  onTapForgot() async {
    if (forgotFormKey.currentState!.validate()) {
      forgotPassword();
    }
  }

  onTapReset() async {
    if (resetFormKey.currentState!.validate()) {
      ResetPassword();
    }
  }

  onTapKeyboard(context) {
    FocusScope.of(context).unfocus();
  }

  signupValidation(type, value) {
    switch (type) {
      case "name":
        if (value.trim().isEmpty) {
          return "First name is required";
        }
        if (value == firstNameController.text.isNotEmpty) {
          return "Please enter valid name";
        }
      case "lastname":
        if (value.trim().isEmpty) {
          return "Last name is required";
        }
        if (value == lastNameController.text.isNotEmpty) {
          return "Please enter valid name";
        }
      case "email":
        if (value!.isEmpty) {
          return "Email is required";
        }
        String pattern = r'^[^@]+@[^@]+\.[^@]+';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return "Please enter a valid email address";
        }
      case "password":
        if (value.trim().isEmpty) {
          return "Password is required";
        }
        if (value.length < 6) {
          return 'password must be at least 6 characters';
        }
      case "confirmpassword":
        if (value.trim().isEmpty) {
          return "Confirm password is required";
        }
        if (value != passwordController.text) {
          return "Passwords do not match";
        }
      default:
        return null;
    }
  }
}
