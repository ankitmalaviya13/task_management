import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/Apis/loginSignupApis.dart';
import 'package:task_management/core/Models/RateModel.dart';
import 'package:task_management/core/constant/constant.dart';

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
    String token = box.read(ConstantsVariables.token) ?? "";
    final response = await loginSignupApi.rateUs(
      headers: {'Authorization': '$token'},
      data: {
        "rate": ratingValue.value?.toInt() ?? 1,
        "rateText": rateUsReviewController.text,
      },
    );
    print("Token");
    print(token);
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
}
