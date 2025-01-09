import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/core/constant/constant.dart';
import 'package:task_management/screens/controllers/editProfile_controller.dart';
import 'package:task_management/screens/widgets/cacheNetworkImage.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<EditProfileController>(
            init: EditProfileController(),
            builder: (logic) {
              return Scaffold(
                appBar: AppBar(
                  leading: InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      )),
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
                          con: controller.firstNameController,
                          hintText: "First Name",
                          hintTextColor: AppColor.primaryColor,
                          borderColor: AppColor.primaryColor,
                        ),
                        const SizedBox(height: 10),
                        CommonTextFieldBorder(
                          con: controller.lastNameController,
                          hintText: "Last Name",
                          hintTextColor: AppColor.primaryColor,
                          borderColor: AppColor.primaryColor,
                        ),
                        const SizedBox(height: 10),
                        CommonTextFieldBorder(
                          con: controller.emailController,
                          hintText: "Email Address",
                          hintTextColor: AppColor.primaryColor,
                          borderColor: AppColor.primaryColor,
                        ),
                        const SizedBox(height: 20),
                        CommonButton(
                          label: "Edit Profile",
                          onPressed: () {
                            print("abc");
                            controller.editProfileUpdateApi();
                          },
                          labelColor: AppColor.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
        Obx(() => controller.isLoading.value ? customIndicator() : Container()),
      ],
    );
  }
}
