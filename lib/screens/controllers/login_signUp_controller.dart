import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/Apis/loginSignupApis.dart';
import 'package:task_management/core/DeviceInfo/device_info.dart';
import 'package:task_management/core/Models/SignUpModel.dart';
import 'package:task_management/core/Models/loginModel.dart';
import 'package:task_management/core/constant/constant.dart';

import '../Routes/app_pages.dart';

class LoginSignupController extends GetxController {
  LoginSignupApi loginSignupApi = LoginSignupApi();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isLoginLoading = false.obs;
  RxBool isSignupLoading = false.obs;
  String? token;

  storedata({token, userId, email, name, firstName, lastName}) {
    box.write(ConstantsVariables.token, token);
    box.write(ConstantsVariables.userId, userId);
    box.write(ConstantsVariables.email, email);
    box.write(ConstantsVariables.firstName, firstName);
    box.write(ConstantsVariables.lastName, lastName);
  }

  loginApi() async {
    var requestData = {
      'email': emailController.text,
      'password': passwordController.text,
      "devicetoken": ConstantsVariables.deviceToken,
      "deviceId": DeviceInfo.deviceId,
      "devicetype": DeviceInfo.deviceType,
    };
    print(requestData);
    isLoginLoading.value = true;
    final response = await loginSignupApi.login(data: requestData);
    if (response.statusCode == 200) {
      print(response.data);
      LoginModel data = LoginModel.fromJson(response.data);
      if (data.status == true) {
        storedata(
          userId: data.user.id ?? '',
          email: data.user.email ?? '',
          firstName: data.user.firstName ?? '',
          lastName: data.user.lastName ?? '',
        );
        print('token');
        print(data.userToken);
      } else {
        isLoginLoading.value = false;
        Toasty.showtoast(data.message.toString());
        Get.toNamed(Routes.BOTTOMBAR);
      }
    } else {
      isLoginLoading.value = false;
      Toasty.showtoast(response.statusMessage.toString());
    }
  }

  signupApi() async {
    isSignupLoading.value = true;
    var jsonData = {
      "email": emailController.text,
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "password": passwordController.text,
      "devicetoken": ConstantsVariables.deviceToken,
      "deviceId": DeviceInfo.deviceId,
      "devicetype": DeviceInfo.deviceType,
    };

    print("Eded'deeddedeede");
    print(ConstantsVariables.deviceToken);
    print(DeviceInfo.deviceId);
    print(DeviceInfo.deviceType);
    print(jsonData);
    final response = await loginSignupApi.signUp(data: jsonData);
    if (response.statusCode == 200) {
      SignUpModel data = SignUpModel.fromJson(response.data);
      if (data.status == true) {
      } else {
        isLoginLoading.value = false;
        Toasty.showtoast(data.message.toString());
        Get.toNamed(Routes.BOTTOMBAR);
      }
    } else {
      isLoginLoading.value = false;
      Toasty.showtoast(response.statusMessage.toString());
    }
  }
}
