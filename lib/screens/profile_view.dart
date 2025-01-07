import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/Apis/loginSignupApis.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/core/constant/constant.dart';
import 'package:task_management/screens/Routes/app_pages.dart';
import 'package:task_management/screens/change_password.dart';
import 'package:task_management/screens/editProfile.dart';
import 'package:task_management/screens/rating_view.dart';
import 'package:task_management/screens/widgets/cacheNetworkImage.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/logout_popup.dart';

class ProfileView extends GetView {
  ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    List prfileMenu = [
      {"title": "Change Password", "id": 1, "icon": Icons.password},
      {"title": "Rate The App", "id": 2, "icon": Icons.eighteen_up_rating},
      {"title": "Log Out", "id": 3, "icon": Icons.logout},
    ];
    onListItemTap(index) {
      switch (index) {
        case 0:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Changepassword()));
          break;
        case 1:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RatingView()));
          break;
        case 2:
          showDialog(
            context: context,
            builder: (context) {
              return LogoutPopup(onConfirm: () {
                logoutApi();
              });
            },
          );
          break;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              cachedNetworkImage(
                circular: 100.0,
                image: "https://picsum.photos/200/300",
                height: 100.0,
                width: 100.0,
                fit: BoxFit.fill,
                clipRRectBorderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              const SizedBox(
                height: 20,
              ),
              const CommonText(
                text: "Shane Whatson",
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 5,
              ),
              const CommonText(
                text: "Shanewhatson@gmail.com",
                fontSize: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              CommonButton(
                label: "Edit Profile",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(),
                      ));
                },
                labelColor: AppColor.white,
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(prfileMenu[index]["icon"]),
                        title: CommonText(
                          text: prfileMenu[index]["title"],
                          fontSize: 18,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          onListItemTap(index);
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  LoginSignupApi loginSignupApi = LoginSignupApi();
  RxBool isLogOutLoading = false.obs;

  logoutApi() async {
    isLogOutLoading.value = true;
    String token = box.read(ConstantsVariables.token) ?? "";
    final response = await loginSignupApi.logout(
      headers: {'Authorization': '$token'},
    );
    print("Token");
    print(token);
    isLogOutLoading.value = false;
    print(response);
    if (response.statusCode == 200) {
      if (response.data["Status"] == 1) {
        isLogOutLoading.value = false;
        box.erase();
        Get.offAllNamed(Routes.LOGIN_SIGNUP);
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
