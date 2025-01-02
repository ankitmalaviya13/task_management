import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/bottomBar_Screen.dart';
import 'package:task_management/screens/forgotPassword_Screen.dart';
import 'package:task_management/screens/register_Screen.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import '../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Gdfgdfgf");
    return ChangeNotifierProvider.value(
      value: LoginProvider(),
      child: LoginWidget(),
    );
  }
}

class LoginWidget extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              CommonTextFieldBorder(
                con: _emailController,
                hintText: "Email Address",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
              ),
              const SizedBox(height: 20),
              Consumer<LoginProvider>(builder: (context, authProvider, _) {
                return CommonTextFieldBorder(
                  con: _passwordController,
                  hintText: "Password",
                  obscureText: authProvider.obsecure,
                  hintTextColor: AppColor.primaryColor,
                  borderColor: AppColor.primaryColor,
                  suffix: IconButton(
                      onPressed: () {
                        authProvider.togglePasswordVisibility();
                      },
                      icon: Icon(Icons.remove_red_eye_sharp)),
                );
              }),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomBarScreen(),
                      ));
                },
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
