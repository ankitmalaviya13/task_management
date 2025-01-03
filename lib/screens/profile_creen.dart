import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/screens/controllers/bottomBar_controller.dart';
import 'package:task_management/screens/login.dart';
import 'package:task_management/screens/rating_screen.dart';
import 'package:task_management/screens/widgets/cacheNetworkImage.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/logout_popup.dart';

import '../core/color/color.dart';
import 'change_password.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Controller = Get.put<BottomBarController>(BottomBarController());
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RatingScreen()));
        break;
      case 2:
        showDialog(
          context: context,
          builder: (context) {
            return LogoutPopup(onConfirm: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginView()),
                (route) => false,
              );
            });
          },
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
}
