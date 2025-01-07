import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/providers/Authentication/auth_provider.dart';
import 'package:task_management/screens/widgets/cacheNetworkImage.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';
import 'package:task_management/screens/widgets/image_selection_widget.dart';

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
    final authProvider = context.read<AuthProvider>();
    print("fjfkfjhsdkhfsjkf");
    final TextEditingController _firstNameController = TextEditingController(text: authProvider.firstName);
    final TextEditingController _lastNameController = TextEditingController(text: authProvider.lastName);
    final TextEditingController _emailController = TextEditingController(text: authProvider.email);

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
              Selector2<AuthProvider, EditProfileProvider, String?>(
                selector: (context, authProvider, editProfileProvider) => provider.image,
                builder: (context, image, _) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => ImagePickerOptionWidget(
                          onTap: (ImageSource source) async {
                            await editProfileProvider.pickimage(source);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    child: image != null
                        ? Container(
                            height: 100.0,
                            width: 100.0,
                            child: Image.file(
                              File(image),
                              fit: BoxFit.fill, // Adjust the fit as needed
                            ),
                          )
                        : cachedNetworkImage(
                            circular: 100.0,
                            image: "https://picsum.photos/200/300",
                            height: 100.0,
                            width: 100.0,
                            fit: BoxFit.fill,
                            clipRRectBorderRadius: BorderRadius.all(Radius.circular(50.0)),
                          ),
                  );
                },
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
                onPressed: () {},
                labelColor: AppColor.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
