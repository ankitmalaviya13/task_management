import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/Apis/loginSignupApis.dart';
import 'package:task_management/core/Models/UserModel.dart';
import 'package:task_management/core/constant/constant.dart';

class EditProfileController extends GetxController {
  LoginSignupApi loginSignupApi = LoginSignupApi();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxBool isLoading = false.obs;

  editProfileUpdateApi() async {
    isLoading.value = true;

    // var data = await wrapFromData(updateData);
    // if (pickedFile.value.isNotEmpty) {
    //   data = await wrapMultiPartImages(File(pickedFile.value), data, "profile_pic");
    // }
    String token = box.read(ConstantsVariables.token) ?? "";
    final response = await loginSignupApi.editProfileUpdate(
      headers: {'Authorization': '$token'},
      data: {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
      },
    );

    print(response);
    if (response.statusCode == 200) {
      UserModel userModel = UserModel.fromJson(response.data);
      if (userModel.status == 1) {
        // userDetail.value = userModel!.user!;
        // profileFullNameController.text = userDetail.value!.fullName!;
        // profileEmailController.text = userDetail.value!.email!;
        // profileMobileNumberController.text = userDetail.value!.phone!.replaceAll(userDetail.value!.countryCode!, "");
        // profileBirthDateController.text = "${DateFormat('yyyy-MM-dd').format(userDetail.value!.birthDate!) ?? ""}";
        // profileBirthTimeController.text = "${userDetail.value?.birthTime ?? ""}";
        // countryCode.value = userDetail.value!.countryCode!;
        // pickedFile.value = "";
        // profilePic.value = "${userDetail.value?.profilePic ?? " "}";
        // readOnly.value = true;
        // deleteImageFromCache();
        // storedata(
        //   name: userDetail.value!.fullName!,
        //   email: userDetail.value!.email!,
        //   firstName: userDetail.value!.firstName,
        //   lastName: userDetail.value!.lastName,
        //   profilepic: userDetail.value?.profilePic,
        // );
        isLoading.value = false;
        Toasty.showtoast(userModel.message.toString());
        Get.back();
      } else {
        Toasty.showtoast(userModel.message.toString());
        isLoading.value = false;
      }
    } else {
      isLoading.value = false;
      Toasty.showtoast(response.statusMessage.toString());
    }
  }
}
