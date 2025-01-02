import 'package:flutter/material.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/home_Screen.dart';
import 'package:task_management/screens/myProject_Screen.dart';
import 'package:task_management/screens/profile_creen.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const MyProjectScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? AppColor.primaryColor : Colors.black,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.file_copy_rounded,
                color: _selectedIndex == 1 ? AppColor.primaryColor : Colors.black,
              ),
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 48),
            IconButton(
              icon: Icon(
                Icons.calendar_month_sharp,
                color: _selectedIndex == 2 ? AppColor.primaryColor : Colors.black,
              ),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: _selectedIndex == 3 ? AppColor.primaryColor : Colors.black,
              ),
              onPressed: () => _onItemTapped(3),
            ),
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
              const CommonTextFieldBorder(
                hintText: "Project Name",
                hintTextColor: AppColor.black,
                borderColor: AppColor.greyText,
              ),
              const SizedBox(height: 20),
              if (_isDropdownVisible) // Conditionally render dropdown
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
                    _selectedVisibility = value; // Update the selected value
                  },
                ),
              const SizedBox(height: 20),
              const CommonButtonColor(
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
                onPressed: () {},
              )
            ],
          ),
        );
      },
    );
  }
}
