import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';
import 'package:task_management/screens/widgets/loading_widget.dart';

import '../core/color/color.dart';
import '../providers/profile/change_password_provider.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  @override
  Widget build(BuildContext context) {
    print("fsdkfhskfjhsfdf");
    return ChangeNotifierProvider(
      create: (_) => ChangePasswordProvider(),
      child: ChangePasswordWidget(),
    );
  }
}

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _oldPasswordController = TextEditingController();
    final TextEditingController _newPasswordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SafeArea(
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
                  CommonTextFieldBorder(
                    con: _oldPasswordController,
                    hintText: "Enter Old Password",
                    hintTextColor: AppColor.primaryColor,
                    borderColor: AppColor.primaryColor,
                    suffix: Icon(Icons.remove_red_eye_sharp),
                  ),
                  const SizedBox(height: 20),
                  CommonTextFieldBorder(
                    con: _newPasswordController,
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
                  const SizedBox(height: 50),
                  CommonButton(
                    label: "Change Password",
                    labelColor: AppColor.white,
                    labelSize: 17,
                    onPressed: () {
                      context.read<ChangePasswordProvider>().changePassword(_oldPasswordController.text, _newPasswordController.text).then(
                        (v) {
                          if (v == null) {
                            Navigator.pop(context);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Selector<ChangePasswordProvider, bool>(
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
