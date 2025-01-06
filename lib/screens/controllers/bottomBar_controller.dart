import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/Apis/loginSignupApis.dart';
import 'package:task_management/core/Models/RateModel.dart';
import 'package:task_management/core/constant/constant.dart';
import 'package:task_management/screens/Routes/app_pages.dart';

class BottomBarController extends GetxController {
  LoginSignupApi loginSignupApi = LoginSignupApi();

  TextEditingController rateUsReviewController = TextEditingController();
  RxBool load = false.obs;
  RxBool submit = false.obs;
  RxBool isRateUSLoading = false.obs;
  RxBool isRateLoading = false.obs;
  RxBool isLogOutLoading = false.obs;
  final ratingValue = Rxn<double>(0.0);

  rateUS() async {
    isRateUSLoading.value = true;
    submit.value = true;
    final response = await loginSignupApi.rateUs(
      data: {
        "rate": ratingValue.value?.toInt() ?? 1,
        "rateText": rateUsReviewController.text,
      },
    );
    if (response.statusCode == 200) {
      RateModel data = RateModel.fromJson(response.data);
      if (data.status == true) {
        isRateLoading.value = false;
        rateUsReviewController.clear();
        ratingValue.value = 0.0;
        isRateUSLoading.value = false;
        Toasty.showtoast(data.message.toString());
        submit.value = false;
      } else {
        isRateUSLoading.value = false;
        isRateLoading.value = false;
        Toasty.showtoast(data.message.toString());
        submit.value = false;
      }
    }
  }

  logoutApi() async {
    isLogOutLoading.value = true;
    final response = await loginSignupApi.logout(
      headers: {'Authorization': 'Bearer ${loginSignupApi.useToken}'},
    );
    isLogOutLoading.value = false;
    print(response);
    if (response.statusCode == 200) {
      if (response.data["status"] == true) {
        isLogOutLoading.value = false;
        box.erase();
        Get.toNamed(Routes.LOGIN_SIGNUP);
      } else {
        isLogOutLoading.value = false;
        Toasty.showtoast(response.data["message"].toString());
      }
    } else {
      box.erase();
      isLogOutLoading.value = false;
      Toasty.showtoast(response.statusMessage.toString());
    }
  }
}
