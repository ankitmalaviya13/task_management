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
import 'package:task_management/screens/widgets/loading_widget.dart';

import '../core/constant/app_url.dart';
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  Selector2<AuthProvider, EditProfileProvider, ImageWithSource>(
                    selector: (context, authProvider, editProfileProvider) {
                      if (editProfileProvider.image != null) {
                        return ImageWithSource(image: editProfileProvider.image ?? "", source: 'profile');
                      }
                      print("flsjfsljkjlkd");
                      print(authProvider.profilePic);
                      return ImageWithSource(image: authProvider.profilePic ?? "", source: 'auth');
                    },
                    builder: (context, image, _) {
                      print("${AppUrl.baseUrl}/${image.image}");
                      return GestureDetector(
                        onTap: () {
                          final authprovider = context.read<EditProfileProvider>();
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => ImagePickerOptionWidget(
                              onTap: (ImageSource source) async {
                                await authprovider.pickimage(source);
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                        child: image.source == 'profile'
                            ? Container(
                                height: 100.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  image: DecorationImage(
                                    image: FileImage(
                                      File(image.image),
                                      // Adjust the fit as needed
                                    ) as ImageProvider, // Default image if both are null
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : cachedNetworkImage(
                                circular: 100.0,
                                image: "${AppUrl.baseUrl}/${image.image}",
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
                    onPressed: () {
                      context
                          .read<EditProfileProvider>()
                          .editProfile(
                            _firstNameController.text,
                            _lastNameController.text,
                          )
                          .then((value) {
                        if (value == null) {
                          Navigator.of(context).pop();
                        }
                      });
                    },
                    labelColor: AppColor.white,
                  ),
                ],
              ),
            ),
          ),
          Selector<EditProfileProvider, bool>(
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
