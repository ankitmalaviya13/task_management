import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/widgets/cacheNetworkImage.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import '../providers/profile/edit_profile_provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditProfileProvider(),
      child: EditProfileWidget(),
    );
  }
}

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    final TextEditingController _firstNameController = TextEditingController();
    final TextEditingController _lastNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const CommonText(
          text: "Edit Profile",
          fontSize: 17,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              cachedNetworkImage(
                circular: 100.0,
                image: "https://picsum.photos/200/300",
                height: 100.0,
                width: 100.0,
                fit: BoxFit.fill,
                clipRRectBorderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              const SizedBox(height: 20),
               CommonTextFieldBorder(
                 con: _firstNameController,
                hintText: "First Name",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
              ),
              const SizedBox(height: 10),
               CommonTextFieldBorder(
                 con: _lastNameController,
                hintText: "Last Name",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
              ),
              const SizedBox(height: 10),
               CommonTextFieldBorder(
                 readOnly: true,
                con: _emailController,
                hintText: "Email Address",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
              ),
              const SizedBox(height: 20),
              CommonButton(
                label: "Edit Profile",
                onPressed: () {

                },
                labelColor: AppColor.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
