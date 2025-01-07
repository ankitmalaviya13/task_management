import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_management/core/constant/Assetimages.dart';
import 'package:task_management/screens/controllers/login_signUp_controller.dart';
import 'package:task_management/screens/widgets/common_button.dart';

import '../core/color/color.dart';
import 'widgets/common_text.dart';

class VerifyOtpView extends GetView<LoginSignupController> {
  const VerifyOtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                )),
            const SizedBox(height: 20),
            const Row(
              children: [
                CommonText(
                  text: "Enter Verification Code",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const CommonText(
              text: "we have sent the code verification to your Email",
              color: AppColor.textColor,
              fontSize: 17,
            ),
            const SizedBox(height: 30),
            Image.asset(
              AppAssetImage.logo,
              height: 400,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            PinCodeTextField(
              controller: controller.otpController,
              appContext: context,
              length: 4,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(4),
                fieldHeight: 60,
                fieldWidth: 60,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.blue,
                inactiveColor: Colors.grey.shade200,
                selectedColor: Colors.blue,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onCompleted: (value) {},
              onChanged: (value) {},
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonText(
                  text: "00:30",
                ),
                SizedBox(width: 5),
                CommonText(
                  text: "Resend it",
                  color: AppColor.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 15),
            CommonButton(
              label: "Verify",
              labelColor: AppColor.white,
              labelSize: 17,
              onPressed: () {
                controller.verifyOtp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
