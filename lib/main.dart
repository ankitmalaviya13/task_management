import 'package:flutter/material.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/bottomBar_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
      ),
      themeMode: ThemeMode.system,
      home: const BottomBarScreen(),
    );
  }

  final ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.bgColor,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: AppColor.textColor),
      bodyMedium: TextStyle(color: AppColor.greyText),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColor.primaryColor,
      iconTheme: IconThemeData(color: AppColor.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColor.buttonWhite,
    ),
  );

  final ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.darkPrimaryColor,
    scaffoldBackgroundColor: AppColor.darkBgColor,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: AppColor.darkTextColor),
      bodyMedium: TextStyle(color: AppColor.greyText),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColor.darkPrimaryColor,
      iconTheme: IconThemeData(color: AppColor.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColor.darkButtonWhite,
    ),
  );
}
