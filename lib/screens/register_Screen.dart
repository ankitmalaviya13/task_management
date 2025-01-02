import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/screens/login_Screen.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import '../core/color/color.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const CommonTextFieldBorder(
                hintText: "First Name ",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
              ),
              const SizedBox(height: 20),
              const CommonTextFieldBorder(
                hintText: "Last Name",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
              ),
              const SizedBox(height: 20),
              const CommonTextFieldBorder(
                hintText: "Email Address",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
              ),
              const SizedBox(height: 15),
              const CommonTextFieldBorder(
                hintText: "Password",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
                suffix: Icon(Icons.remove_red_eye_sharp),
              ),
              const SizedBox(height: 15),
              const CommonTextFieldBorder(
                hintText: "Confirm Password",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
                suffix: Icon(Icons.remove_red_eye_sharp),
              ),
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
                        style: const TextStyle(
                            color: AppColor.black,
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
                onPressed: () {},
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: "Already have an account ? ",
                      style: TextStyle(
                        color: AppColor.black,
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
                            builder: (context) => LoginScreen(),
                          ));
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
    );
  }
}
