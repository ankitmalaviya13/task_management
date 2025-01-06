import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:task_management/screens/bottomBar_Screen.dart';
import 'package:task_management/screens/reset_Password.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/loading_widget.dart';

import '../core/color/color.dart';
import '../core/constant/Assetimages.dart';
import '../providers/Authentication/verify_otp_provider.dart';

class VerifyOtp extends StatelessWidget {
  final email;
  final pass_req;

  const VerifyOtp({super.key, this.email, this.pass_req});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VerifyOtpProvider(email,pass_req),
      child: VerifyOtpWidget(),
    );
  }
}

class VerifyOtpWidget extends StatelessWidget {
  const VerifyOtpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _otpController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                  appContext: context,
                  controller: _otpController,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonText(
                      text: "00:30",
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        final provider = Provider.of<VerifyOtpProvider>(context, listen: false);
                        provider.resendOtp().then((v) {});
                      },
                      child: CommonText(
                        text: "Resend it",
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CommonButton(
                  label: "Verify",
                  labelColor: AppColor.white,
                  labelSize: 17,
                  onPressed: () {
                    final provider = Provider.of<VerifyOtpProvider>(context, listen: false);
                    provider.verifyOtp(_otpController.text).then((v) {
                      if(v==2){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  ResetPassword(email: provider.email,otp: _otpController.text,),
                            ));
                      }
                      if(v==null){
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => BottomBarScreen()),
                              (route) => false, // This clears all previous routes
                        );

                      }

                    });

                  },
                ),
              ],
            ),
          ),
          Selector<VerifyOtpProvider, bool>(
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
