import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/controllers/login_signUp_controller.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

class ChangePasswordView extends GetView<LoginSignupController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: controller.resetFormKey,
          child: Column(
            children: [
              const CommonText(
                text: "Change Password",
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 50),
              Obx(() => CommonTextFieldBorder(
                    con: controller.oldPasswordController,
                    hintText: "Enter Old Password",
                    hintTextColor: AppColor.primaryColor,
                    borderColor: AppColor.primaryColor,
                    obscureText: controller.obSecurePassword.value,
                    suffix: InkWell(
                      onTap: () => controller.obSecurePassword.value = !controller.obSecurePassword.value,
                      child: Icon(controller.obSecurePassword.value ? Icons.visibility_off_rounded : Icons.visibility,
                          size: 18, color: AppColor.darkGrey),
                    ),
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Password is required";
                      }
                      if (v.length < 6) {
                        return 'password must be at least 6 characters';
                      }
                      return null;
                    },
                  )),
              const SizedBox(height: 20),
              Obx(() => CommonTextFieldBorder(
                    con: controller.newPasswordController,
                    hintText: "Enter New Password",
                    hintTextColor: AppColor.primaryColor,
                    borderColor: AppColor.primaryColor,
                    obscureText: controller.obSecureConfirmPassword.value,
                    suffix: InkWell(
                      onTap: () => controller.obSecureConfirmPassword.value = !controller.obSecureConfirmPassword.value,
                      child: Icon(
                          controller.obSecureConfirmPassword.value ? Icons.visibility_off_rounded : Icons.visibility,
                          size: 18,
                          color: AppColor.darkGrey),
                    ),
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "New password is required";
                      }
                      if (v.length < 6) {
                        return 'password must be at least 6 characters';
                      }
                      return null;
                    },
                  )),
              const SizedBox(height: 20),
              Obx(() => CommonTextFieldBorder(
                    con: controller.confirmPasswordController,
                    hintText: "Re-Enter Password",
                    hintTextColor: AppColor.primaryColor,
                    borderColor: AppColor.primaryColor,
                    obscureText: controller.REobSecureConfirmPassword.value,
                    suffix: InkWell(
                      onTap: () =>
                          controller.REobSecureConfirmPassword.value = !controller.REobSecureConfirmPassword.value,
                      child: Icon(
                          controller.REobSecureConfirmPassword.value ? Icons.visibility_off_rounded : Icons.visibility,
                          size: 18,
                          color: AppColor.darkGrey),
                    ),
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Confirm password is required";
                      }
                      if (v.length < 6) {
                        return 'password must be at least 6 characters';
                      }
                      return null;
                    },
                  )),
              const SizedBox(height: 50),
              CommonButton(
                label: "Change Password",
                labelColor: AppColor.white,
                labelSize: 17,
                onPressed: () {
                  controller.onTapKeyboard(context);
                  controller.onTapChange();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
