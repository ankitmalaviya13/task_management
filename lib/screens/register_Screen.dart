import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/screens/login_Screen.dart';
import 'package:task_management/screens/verify_Otp.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';
import 'package:task_management/screens/widgets/loading_widget.dart';

import '../core/color/color.dart';
import '../core/common_providers/password_visibility_provider.dart';
import '../providers/Authentication/signup_provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpProvider(),
      child: SignupWidget(),
    );
  }
}

class SignupWidget extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                CommonTextFieldBorder(
                  con: _firstNameController,
                  hintText: "First Name ",
                  hintTextColor: AppColor.primaryColor,
                  borderColor: AppColor.primaryColor,
                ),
                const SizedBox(height: 20),
                CommonTextFieldBorder(
                  con: _lastNameController,
                  hintText: "Last Name",
                  hintTextColor: AppColor.primaryColor,
                  borderColor: AppColor.primaryColor,
                ),
                const SizedBox(height: 20),
                CommonTextFieldBorder(
                  con: _emailController,
                  hintText: "Email Address",
                  hintTextColor: AppColor.primaryColor,
                  borderColor: AppColor.primaryColor,
                ),
                const SizedBox(height: 15),
                Consumer<PasswordVisibilityProvider>(
                  builder: (context, authProvider, _) {
                    return CommonTextFieldBorder(
                      con: _passwordController,
                      hintText: "Password",
                      hintTextColor: AppColor.primaryColor,
                      obscureText: authProvider.getVisibility(PasswordField.signupPassword.name),
                      borderColor: AppColor.primaryColor,
                      suffix: IconButton(
                          onPressed: () {
                            authProvider.toggleVisibility(PasswordField.signupPassword.name);
                          },
                          icon: Icon(Icons.remove_red_eye_sharp)),
                    );
                  },
                ),
                const SizedBox(height: 15),
                Consumer<PasswordVisibilityProvider>(
                  builder: (context, authProvider, _) {
                    return CommonTextFieldBorder(
                      con: _confirmPasswordController,
                      hintText: "Confirm Password",
                      hintTextColor: AppColor.primaryColor,
                      obscureText: authProvider.getVisibility(PasswordField.signupConfirmPassword.name),
                      borderColor: AppColor.primaryColor,
                      suffix: IconButton(
                          onPressed: () {
                            authProvider.toggleVisibility(PasswordField.signupConfirmPassword.name);
                          },
                          icon: Icon(Icons.remove_red_eye_sharp)),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child:

                      Selector<SignUpProvider, bool>(

                        selector: (context, provider) => provider.check,
                        builder: (context, check, _) {
                          print("checkbox");
                          return Checkbox(
                            value: check,
                            onChanged: (v) {
                              context.read<SignUpProvider>().onCheckbox(v);
                            },
                            activeColor: AppColor.primaryColor,
                          );
                        },

                      ),


                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "I agree to the",
                          style: TextStyle(
                              color: (isDarkMode ? Colors.white : Colors.black),
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
                  onPressed: () {
                    final provider = Provider.of<SignUpProvider>(context, listen: false);
                    provider.signup(
                     _emailController.text,
                     _passwordController.text,
                     _firstNameController.text,
                      _lastNameController.text,
                    ).then((v){
                      if(v==null){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  VerifyOtp(email: _emailController.text,pass_req: 0,),
                            ));
                      }


                    });
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Already have an account ? ",
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
          Selector<SignUpProvider, bool>(

            selector: (context, provider) => provider.isLoading,
            builder: (context, isLoading, _) {
              print("Loader rebuilt");
              return isLoading ? customIndicator() : const SizedBox();
            },

          ),

        ],
      ),
    );
  }
}


