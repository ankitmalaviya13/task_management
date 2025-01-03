import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/core/constant/constant.dart';
import 'package:task_management/screens/forgotPassword_Screen.dart';
import 'package:task_management/screens/register_Screen.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import 'controllers/login_signUp_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authCon = Get.put<LoginSignupController>(LoginSignupController());
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                    con: authCon.emailController,
                    hintText: "Email Address",
                    hintTextColor: AppColor.primaryColor,
                    borderColor: AppColor.primaryColor,
                  ),
                  const SizedBox(height: 20),
                  CommonTextFieldBorder(
                    con: authCon.passwordController,
                    hintText: "Password",
                    hintTextColor: AppColor.primaryColor,
                    borderColor: AppColor.primaryColor,
                    suffix: Icon(Icons.remove_red_eye_sharp),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ));
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
                      authCon.loginApi();
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
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
        Obx(() => authCon.isLoginLoading.value ? customIndicator() : Container()),
      ],
    );
  }
}
