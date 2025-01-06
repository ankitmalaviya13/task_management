import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/core/constant/Assetimages.dart';
import 'package:task_management/screens/login_Screen.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import '../core/color/color.dart';
import '../providers/Authentication/reset_password_provider.dart';

class ResetPassword extends StatelessWidget {
  final email;
  final otp;
  const ResetPassword({super.key, this.email, this.otp});

  @override
  Widget build(BuildContext context) {
    print("fsldkfjsfkjh");
    print(email);
    print(otp);
    return ChangeNotifierProvider(
      create: (_) => ResetPasswordProvider(),
      child: resetPasswordWidget(email: email, otp: otp),
    );
  }
}

class resetPasswordWidget extends StatelessWidget {
  final email;
  final otp;
  const resetPasswordWidget({
    super.key,
    this.email,
    this.otp,
  });

  @override
  Widget build(BuildContext context) {

    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();
    print("gdfgdfgdfgdfg");
    print(email);
    print(otp);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded)),
            const SizedBox(height: 20),
            const Row(
              children: [
                CommonText(
                  text: "Enter New Password",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const CommonText(
              text: "Please enter your new password",
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
              con: _passwordController,
              hintText: "Enter New Password",
              hintTextColor: AppColor.primaryColor,
              borderColor: AppColor.primaryColor,
              suffix: Icon(Icons.remove_red_eye_sharp),
            ),
            const SizedBox(height: 20),
            CommonTextFieldBorder(
              con: _confirmPasswordController,
              hintText: "Re-Enter Password",
              hintTextColor: AppColor.primaryColor,
              borderColor: AppColor.primaryColor,
              suffix: Icon(Icons.remove_red_eye_sharp),
            ),
            const SizedBox(height: 20),
            CommonButton(
              label: "Update Password",
              labelColor: AppColor.white,
              labelSize: 17,
              onPressed: () {
                final provider = Provider.of<ResetPasswordProvider>(context, listen: false);
                provider.resetPassword(email, otp, _passwordController.text).then((v) {
                  if (v == null) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false, // This clears all previous routes
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
