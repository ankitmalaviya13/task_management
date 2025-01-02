import 'package:flutter/material.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import '../core/color/color.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const CommonText(
                text: "Change Password",
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 50),
              const CommonTextFieldBorder(
                hintText: "Enter Old Password",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
                suffix: Icon(Icons.remove_red_eye_sharp),
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
              const SizedBox(height: 50),
              CommonButton(
                label: "Change Password",
                labelColor: AppColor.white,
                labelSize: 17,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
