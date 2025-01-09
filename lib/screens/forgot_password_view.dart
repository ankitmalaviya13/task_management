import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/constant/Assetimages.dart';
import 'package:task_management/screens/controllers/login_signUp_controller.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import '../core/color/color.dart';

class ForgotPasswordView extends GetView<LoginSignupController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.forgotFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              InkWell(
                  onTap: () => controller.onTapForgetPasswordBack(),
                  child: const Icon(Icons.arrow_back_ios_new_rounded)),
              const SizedBox(height: 25),
              const Row(
                children: [
                  CommonText(
                    text: "Forgot password",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const CommonText(
                text: "select which contact details should we use to reset your password.",
                color: AppColor.textColor,
              ),
              const SizedBox(height: 30),
              Image.asset(
                AppAssetImage.logo,
                height: 450,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              CommonTextFieldBorder(
                con: controller.emailController,
                hintText: "Email Address",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Email is required";
                  }
                  String pattern = r'^[^@]+@[^@]+\.[^@]+';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(v)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CommonButton(
                label: "Continue",
                labelColor: AppColor.white,
                labelSize: 17,
                onPressed: () {
                  controller.onTapKeyboard(context);
                  controller.onTapForgot();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
