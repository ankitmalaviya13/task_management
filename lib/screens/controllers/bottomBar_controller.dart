import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/Apis/loginSignupApis.dart';
import 'package:task_management/core/Apis/projectApis.dart';
import 'package:task_management/core/Models/RateModel.dart';
import 'package:task_management/core/constant/constant.dart';

import '../../core/Models/ProjectListModel.dart';

class BottomBarController extends GetxController {
  LoginSignupApi loginSignupApi = LoginSignupApi();
  ProjectApi projectAPi = ProjectApi();

  TextEditingController rateUsReviewController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  RxBool load = false.obs;
  RxBool submit = false.obs;
  RxBool isRateUSLoading = false.obs;
  RxBool isRateLoading = false.obs;
  RxBool isLogOutLoading = false.obs;
  final ratingValue = Rxn<double>(0.0);
  RxBool isLoading = false.obs;
  RxList<Project> projectList = <Project>[].obs;

  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    project();
    super.onInit();
  }

  project() async {
    isLoading.value = true;
    try {
      String token = box.read(ConstantsVariables.token) ?? "";
      final response = await projectAPi.getProject(
        headers: {'Authorization': token},
      );
      print("token: $token");
      print("response: ${response.data}");
      if (response.statusCode == 200) {
        final projectData = Project.fromJson(response.data);
        if (projectData.status == 1) {
          projectList.clear();
          projectList.add(projectData);
          // projectList.addAll(projectData.projects ?? []);
          isLoading.value = false;
        } else {
          Toasty.showtoast(projectData.message.toString());
          isLoading.value = false;
        }
      } else {
        Toasty.showtoast(response.statusMessage.toString());
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  createProject() async {
    isLoading.value = true;
    try {
      String token = box.read(ConstantsVariables.token) ?? "";
      final response = await projectAPi.createProject(
        headers: {'Authorization': token},
        data: {
          'name': projectNameController.text,
          'visibility': "public",
          'members': "6774eb8ddf8836c061202c25",
        },
      );
      print("token: $token");
      print("response: ${response.data}");
      if (response.statusCode == 200) {
        final data = Project.fromJson(response.data);
        if (data.status == 1) {
          isLoading.value = false;
        } else {
          Toasty.showtoast(data.message.toString());
          isLoading.value = false;
        }
      } else {
        Toasty.showtoast(response.statusMessage.toString());
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

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
      if (data.status == 1) {
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
