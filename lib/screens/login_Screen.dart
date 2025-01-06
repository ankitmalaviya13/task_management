import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/bottomBar_Screen.dart';
import 'package:task_management/screens/forgotPassword_Screen.dart';
import 'package:task_management/screens/register_Screen.dart';
import 'package:task_management/screens/verify_Otp.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';
import 'package:task_management/screens/widgets/loading_widget.dart';

import '../core/common_providers/password_visibility_provider.dart';
import '../providers/Authentication/login_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: LoginWidget(),
    );
  }
}

class LoginWidget extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("fsdjgkjf");
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
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
                Consumer<PasswordVisibilityProvider>(
                  builder: (context, passwordVisibilityProvider, _) {
                    print("GGHDKJFHGDFK");
                    return CommonTextFieldBorder(
                      con: _passwordController,
                      hintText: "Password",
                      obscureText: passwordVisibilityProvider.getVisibility(PasswordField.loginPassword.name),
                      hintTextColor: AppColor.primaryColor,
                      borderColor: AppColor.primaryColor,
                      suffix: IconButton(
                          onPressed: () {
                            passwordVisibilityProvider.toggleVisibility(PasswordField.loginPassword.name);
                          },
                          icon: Icon(Icons.remove_red_eye_sharp)),
                    );
                  },
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
                  onPressed: () {
                    _login(context);
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Didn't have account ? ",
                        style: TextStyle(
                          color: (isDarkMode ? Colors.white : Colors.black),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
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
          Consumer<LoginProvider>(
            builder: (context, authProvider, _) {
              print("loading");
              return authProvider.isLoading ? customIndicator() : SizedBox();
            },
          ),
        ],
      ),
    );
  }

  void _login(context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final provider = Provider.of<LoginProvider>(context, listen: false);
    await provider.login(email, password).then((v) {
      if (v == null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomBarScreen(),
            )); //
      }
      if (v == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyOtp(email: _emailController.text, pass_req: 1),
            ));
      }
    });
  }
}
