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
  Rx<User?> userDetail = Rx<User?>(null);
  final editProfileFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    userDetailApi();
    super.onInit();
  }

  onTapKeyboard(context) {
    FocusScope.of(context).unfocus();
  }

  onTapEditProfile() async {
    if (editProfileFormKey.currentState!.validate()) {
      editProfileUpdateApi();
    }
  }

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
        userDetail.value = userModel.user;
        firstNameController.text = userDetail.value!.firstName;
        lastNameController.text = userDetail.value!.lastName;
        emailController.text = userDetail.value!.email;

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

  userDetailApi() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    String token = box.read(ConstantsVariables.token) ?? "";
    final response = await loginSignupApi.userDetail(
      headers: {'Authorization': token},
    );
    print("token");
    print(token);
    print("response");
    print(response);
    if (response.statusCode == 200) {
      UserModel userModel = UserModel.fromJson(response.data);
      if (userModel.status == 1) {
        userDetail.value = userModel.user;
        firstNameController.text = userDetail.value!.firstName;
        lastNameController.text = userDetail.value!.lastName;
        emailController.text = userDetail.value!.email;
        // userDetail.value = userModel!.user!;
        // profileFullNameController.text = userDetail.value!.fullName!;
        // profileEmailController.text = userDetail.value!.email!;
        // number.value = PhoneNumber(
        //     countryISOCode: "IN",
        //     countryCode: userDetail.value!.countryCode!,
        //     number: userDetail.value!.phone!.replaceAll(userDetail.value!.countryCode!, ""));
        // print(number);
        // print(number?.value?.completeNumber);
        // profileBirthDateController.text = "${DateFormat('yyyy-MM-dd').format(userDetail.value!.birthDate!) ?? ""}";
        // profileBirthTimeController.text = "${userDetail.value?.birthTime ?? ""}";
        // countryCode.value = "${userDetail.value?.countryCode ?? " + 91"}";
        // profilePic.value = "${userDetail.value?.profilePic ?? " "}";
        // print(profilePic.value);
        update();
        // number.refresh();
        isLoading.value = false;
      } else {
        Toasty.showtoast(userModel.message.toString());
        isLoading.value = false;
      }
    } else {
      isLoading.value = false;
      Toasty.showtoast(response.statusMessage.toString());
    }
  }

  editProfileValidation(type, value) {
    switch (type) {
      case "firstName":
        if (value.trim().isEmpty) {
          return "First name is required";
        }
        if (value == firstNameController.text.isNotEmpty) {
          return "Please enter valid name";
        }
      case "lastname":
        if (value.trim().isEmpty) {
          return "Last name is required";
        }
        if (value == lastNameController.text.isNotEmpty) {
          return "Please enter valid name";
        }
      case "email":
        if (value!.isEmpty) {
          return "Email is required";
        }
        String pattern = r'^[^@]+@[^@]+\.[^@]+';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return "Please enter a valid email address";
        }
      default:
        return null;
    }
  }
}
