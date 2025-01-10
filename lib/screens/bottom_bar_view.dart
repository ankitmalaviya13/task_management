import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/screens/addTeam_Member.dart';
import 'package:task_management/screens/controllers/bottomBar_controller.dart';
import 'package:task_management/screens/home_view.dart';
import 'package:task_management/screens/myProject_Screen.dart';
import 'package:task_management/screens/profile_view.dart';
import 'package:task_management/screens/schedule_Screen.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import '../../../core/color/color.dart';

class BottomBarScreen extends GetView<BottomBarController> {
  BottomBarScreen({Key? key}) : super(key: key);

  final List<Widget> _screens = [
    const HomeView(),
    const MyProjectScreen(),
    const ScheduleScreen(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GetBuilder<BottomBarController>(
        init: BottomBarController(),
        builder: (logic) {
          return Scaffold(
            body: Obx(() => _screens[controller.selectedIndex.value]),
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildBottomBarIcon(Icons.home, 0, isDarkMode),
                  _buildBottomBarIcon(Icons.file_copy_rounded, 1, isDarkMode),
                  const SizedBox(width: 48),
                  _buildBottomBarIcon(Icons.calendar_month_sharp, 2, isDarkMode),
                  _buildBottomBarIcon(Icons.account_circle, 3, isDarkMode),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              elevation: 6.0,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.add,
                color: AppColor.white,
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
        });
  }

  Widget _buildBottomBarIcon(IconData icon, int index, bool isDarkMode) {
    return IconButton(
      icon: Obx(() => Icon(
            icon,
            color: controller.selectedIndex.value == index
                ? AppColor.primaryColor
                : (isDarkMode ? Colors.white : Colors.black),
          )),
      onPressed: () => controller.onItemTapped(index),
    );
  }

  void _showBottomSheet(BuildContext context) {
    bool _isDropdownVisible = true;
    String? _selectedVisibility;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CommonText(
                    text: "Create New Project",
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CommonTextFieldBorder(
                con: controller.projectNameController,
                hintText: "Project Name",
                hintTextColor: AppColor.black,
                borderColor: AppColor.greyText,
                fillColor: AppColor.transparent,
              ),
              const SizedBox(height: 20),
              if (_isDropdownVisible)
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: AppColor.primaryColor),
                    ),
                  ),
                  hint: const CommonText(
                    text: "Visibility",
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                  ),
                  value: _selectedVisibility,
                  items: const [
                    DropdownMenuItem(
                      value: "Public",
                      child: CommonText(
                        text: "Public",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Private",
                      child: CommonText(
                        text: "Private",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    _selectedVisibility = value;
                  },
                ),
              const SizedBox(height: 20),
              CommonButtonColor(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTeamMember(),
                      ));
                },
                label: "Add Member",
                buttonBorderColor: AppColor.primaryColor,
                labelColor: AppColor.primaryColor,
                labelSize: 15,
              ),
              const SizedBox(height: 15),
              CommonButton(
                label: "Create Project",
                labelColor: AppColor.white,
                labelSize: 15,
                onPressed: () {
                  controller.createProject();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
