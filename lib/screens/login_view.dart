import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/core/constant/constant.dart';
import 'package:task_management/screens/controllers/login_signUp_controller.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

class LoginView extends GetView<LoginSignupController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return PopScope(
      canPop: false,
      onPopInvoked: (pop) {
        print("Fsdhkfsdkjfhskfsd");
        if (pop) {
          return;
        }
        controller.onTapLoginBack();
      },
      child: Stack(
        children: [
          GetBuilder<LoginSignupController>(
              init: LoginSignupController(),
              builder: (con) {
                return Scaffold(
                  body: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: controller.loginFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            const Row(
                              children: [
                                CommonText(
                                  text: "Welcome Back",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                CommonText(
                                  text: "to",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(width: 10),
                                CommonText(
                                  text: "CANGLY",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.primaryColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const CommonText(
                              text: "Hello there login to continue",
                              color: AppColor.textColor,
                            ),
                            const SizedBox(height: 30),
                            CommonTextFieldBorder(
                                con: controller.emailController,
                                hintText: "Email Address",
                                hintTextColor: AppColor.primaryColor,
                                borderColor: AppColor.primaryColor,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email is required";
                                  }
                                  String pattern = r'^[^@]+@[^@]+\.[^@]+';
                                  RegExp regex = RegExp(pattern);
                                  if (!regex.hasMatch(value)) {
                                    return "Please enter a valid email address";
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 20),
                            Obx(() {
                              return CommonTextFieldBorder(
                                con: controller.passwordController,
                                hintText: "Password",
                                hintTextColor: AppColor.primaryColor,
                                borderColor: AppColor.primaryColor,
                                obscureText: controller.obSecurePassword.value,
                                suffix: InkWell(
                                  onTap: () => controller.obSecurePassword.value = !controller.obSecurePassword.value,
                                  child: Icon(
                                      controller.obSecurePassword.value
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility,
                                      color: AppColor.darkGrey),
                                ),
                                validator: (v) {
                                  if (v!.trim().isEmpty) {
                                    return "Password is required";
                                  }
                                  return null;
                                },
                              );
                            }),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.onTapWelcomeResetPassword();
                                  },
                                  child: const CommonText(
                                    text: "Forgot Password ?",
                                    color: AppColor.primaryColor,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            CommonButton(
                              label: "Login",
                              labelColor: AppColor.white,
                              labelSize: 17,
                              onPressed: () {
                                controller.onTapLogin();
                                controller.onTapKeyboard(context);
                              },
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: "Didn't have account ? ",
                                    style: TextStyle(
                                      color: (isDarkMode ? Colors.white : Colors.black),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.onTapWelcomeSignup();
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      text: "Register",
                                      style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
          Obx(() => controller.isLoginLoading.value ? customIndicator() : Container()),
        ],
      ),
    );
  }
}
