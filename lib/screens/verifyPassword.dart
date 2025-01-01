import 'package:flutter/material.dart';
import 'package:task_management/core/constant/Assetimages.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import '../core/color/color.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

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
            const CommonTextFieldBorder(
              hintText: "Enter New Password",
              hintTextColor: AppColor.primaryColor,
              borderColor: AppColor.primaryColor,
              suffix: Icon(Icons.remove_red_eye_sharp),
            ),
            const SizedBox(height: 20),
            const CommonTextFieldBorder(
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
