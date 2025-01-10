import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/home_Screen.dart';
import 'package:task_management/screens/myProject_Screen.dart';
import 'package:task_management/screens/profile_screen.dart';
import 'package:task_management/screens/schedule_Screen.dart';
import 'package:task_management/screens/widgets/add_prject_widget.dart';

import '../providers/project/add_project_provider.dart';

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
    const ScheduleScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                color: _selectedIndex == 0 ? AppColor.primaryColor : (isDarkMode ? Colors.white : Colors.black),
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.file_copy_rounded,
                color: _selectedIndex == 1 ? AppColor.primaryColor : (isDarkMode ? Colors.white : Colors.black),
              ),
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 48),
            IconButton(
              icon: Icon(
                Icons.calendar_month_sharp,
                color: _selectedIndex == 2 ? AppColor.primaryColor : (isDarkMode ? Colors.white : Colors.black),
              ),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: _selectedIndex == 3 ? AppColor.primaryColor : (isDarkMode ? Colors.white : Colors.black),
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
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (_) => AddProjectProvider(),
          child: CreateProjectWidget(),
        );
      },
    );
  }
}
