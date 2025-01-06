import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/constant/constant.dart';
import 'package:task_management/screens/controllers/login_signUp_controller.dart';
import 'package:task_management/screens/login_view.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import '../core/color/color.dart';

class SignUpView extends GetView<LoginSignupController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CommonText(
                            text: "Register Account",
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
                        con: controller.firstNameController,
                        hintText: "First Name ",
                        hintTextColor: AppColor.primaryColor,
                        borderColor: AppColor.primaryColor,
                        validator: (v) {
                          return controller.signupValidation("name", v);
                        },
                      ),
                      const SizedBox(height: 20),
                      CommonTextFieldBorder(
                        con: controller.lastNameController,
                        hintText: "Last Name",
                        hintTextColor: AppColor.primaryColor,
                        borderColor: AppColor.primaryColor,
                        validator: (v) {
                          return controller.signupValidation("lastname", v);
                        },
                      ),
                      const SizedBox(height: 20),
                      CommonTextFieldBorder(
                        con: controller.emailController,
                        hintText: "Email Address",
                        hintTextColor: AppColor.primaryColor,
                        borderColor: AppColor.primaryColor,
                        validator: (v) {
                          return controller.signupValidation("email", v);
                        },
                      ),
                      const SizedBox(height: 15),
                      Obx(() {
                        return CommonTextFieldBorder(
                          con: controller.passwordController,
                          hintText: "Password",
                          obscureText: controller.obSecurePassword.value,
                          hintTextColor: AppColor.primaryColor,
                          borderColor: AppColor.primaryColor,
                          suffix: InkWell(
                            onTap: () => controller.obSecurePassword.value = !controller.obSecurePassword.value,
                            child: Icon(
                                controller.obSecurePassword.value ? Icons.visibility_off_rounded : Icons.visibility,
                                color: AppColor.darkGrey),
                          ),
                          validator: (v) {
                            return controller.signupValidation("password", v);
                          },
                        );
                      }),
                      const SizedBox(height: 15),
                      Obx(() {
                        return CommonTextFieldBorder(
                          con: controller.confirmPasswordController,
                          hintText: "Confirm Password",
                          obscureText: controller.obSecureConfirmPassword.value,
                          hintTextColor: AppColor.primaryColor,
                          borderColor: AppColor.primaryColor,
                          suffix: InkWell(
                            onTap: () =>
                                controller.obSecureConfirmPassword.value = !controller.obSecureConfirmPassword.value,
                            child: Icon(
                                controller.obSecureConfirmPassword.value
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility,
                                color: AppColor.darkGrey),
                          ),
                          validator: (v) {
                            return controller.signupValidation("confirmpassword", v);
                          },
                        );
                      }),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                              value: true,
                              onChanged: (v) {},
                              activeColor: AppColor.primaryColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: "I agree to the",
                                style: TextStyle(
                                    color: (isDarkMode ? Colors.white : Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()..onTap = () {},
                                    text: "Terms & Conditions & Privacy Policy",
                                    style: const TextStyle(
                                      color: AppColor.primaryColor,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: "set out by this site.",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      CommonButton(
                        label: "Register",
                        labelColor: AppColor.white,
                        labelSize: 17,
                        onPressed: () {
                          controller.onTapKeyboard(context);
                          controller.onTapSignUp();
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Already have an account? ",
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
                                  builder: (context) => const LoginView(),
                                ),
                              );
                            },
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                text: "Login",
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
          ),
        ),
        Obx(() => controller.isSignupLoading.value ? customIndicator() : Container()),
      ],
    );
  }
}
