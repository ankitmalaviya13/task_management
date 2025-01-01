import 'package:flutter/material.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/forgotPasswordScreen.dart';
import 'package:task_management/screens/registerScreen.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              const CommonTextFieldBorder(
                hintText: "Email Address",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
              ),
              const SizedBox(height: 20),
              const CommonTextFieldBorder(
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
                onPressed: () {},
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: "Didn't have account ? ",
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
    );
  }
}
