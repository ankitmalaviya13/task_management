import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/screens/verify_Otp.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';
import 'package:task_management/screens/widgets/loading_widget.dart';

import '../core/color/color.dart';
import '../core/constant/Assetimages.dart';
import '../providers/Authentication/forgot_password_provider.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordProvider(),
      child: ForgotPasswordWidget(),
    );
  }
}

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new_rounded)),
                const SizedBox(height: 25),
                const Row(
                  children: [
                    CommonText(
                      text: "Forgot password",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const CommonText(
                  text: "select which contact details should we use to reset your password.",
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
                  con: _emailController,
                  hintText: "Email Address",
                  hintTextColor: AppColor.primaryColor,
                  borderColor: AppColor.primaryColor,
                ),
                const SizedBox(height: 20),
                CommonButton(
                  label: "Continue",
                  labelColor: AppColor.white,
                  labelSize: 17,
                  onPressed: () {
                    final provider = Provider.of<ForgotPasswordProvider>(context, listen: false);
                    provider.forgotPassword(_emailController.text).then((v) {
                      if (v == null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyOtp(
                                email: _emailController.text,
                                pass_req: 2,
                              ),
                            ));
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Selector<ForgotPasswordProvider, bool>(
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
