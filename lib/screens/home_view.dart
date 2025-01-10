import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/Routes/app_pages.dart';
import 'package:task_management/screens/controllers/bottomBar_controller.dart';
import 'package:task_management/screens/notification_screen.dart';
import 'package:task_management/screens/today_Task.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield.dart';

import '../core/constant/constant.dart';

class HomeView extends GetView<BottomBarController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
        init: BottomBarController(),
        builder: (logic) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBNFUwQmH640OafdOvh-eIPRcB9ZeIBbYfew&s'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: box.read(ConstantsVariables.firstName),
                            fontSize: 15,
                          ),
                          CommonText(
                            text: box.read(ConstantsVariables.lastName),
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const NotificationScreen()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CommonTextField(
                    fillColor: AppColor.white,
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(CupertinoIcons.search, color: AppColor.greyText),
                    ),
                    hintText: "Search",
                    hintTextFontSize: 16,
                    borderColor: AppColor.searchColor,
                    isDense: true,
                    borderOutline: true,
                    onChanged: (v) {},
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const CommonText(
                        text: "My Projects",
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.PROJECT);
                        },
                        child: const CommonText(
                          text: "View All",
                          fontSize: 17,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 190,
                    child: Obx(() => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.projectList.length,
                          itemBuilder: (context, index) {
                            final project = controller.projectList[index];
                            return InkWell(
                              onTap: () => Get.toNamed(Routes.PROJECT),
                              child: Container(
                                padding: const EdgeInsets.only(left: 5),
                                margin: const EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: const BoxDecoration(color: AppColor.primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CommonText(
                                              text: project.projects![index].name ?? "",
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.more_vert,
                                            color: AppColor.white,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: CommonText(
                                              text: DateFormat("dd MMMM yyyy, hh:mma")
                                                  .format(project.projects![index].createdAt.toLocal()),
                                              color: Colors.white,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Row(
                                        children: [
                                          Stack(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.green,
                                                radius: 20,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 10),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.yellow,
                                                  radius: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 15),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColor.primaryColor,
                                                  radius: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 20),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.red,
                                                  radius: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 25),
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: Colors.white,
                                                  child: Text(
                                                    '+3',
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Row(
                                        children: [
                                          Expanded(
                                            child: CommonText(
                                              text: 'Website | Mobile App Design',
                                              color: Colors.white,
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.access_time_outlined,
                                            color: AppColor.white,
                                            size: 18,
                                          ),
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: CommonText(
                                              text: "4 Days ago",
                                              color: AppColor.white,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const CommonText(
                        text: "Today's Task",
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TodayTask(),
                              ));
                        },
                        child: const CommonText(
                          text: "View All",
                          fontSize: 17,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CommonText(
                                      text: 'Client Review & Feedback',
                                      fontSize: 15,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.more_vert,
                                      color: AppColor.black,
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                CommonText(
                                  text: 'Indeep Project Website',
                                  color: AppColor.greyText,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13,
                                ),
                                SizedBox(height: 10),
                                CommonText(
                                  text: 'Today 10:00PM - 10:30 PM',
                                  color: AppColor.black,
                                  fontSize: 15,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
