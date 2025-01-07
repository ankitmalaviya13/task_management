import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_management/core/DeviceInfo/device_info.dart';
import 'package:task_management/core/color/color.dart';

import 'core/DeviceInfo/device_information_model.dart';
import 'screens/Routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await getDeviceInfo();
  runApp(MyApp());
}

Future<void> getDeviceInfo() async {
  DeviceInformationModel deviceInfo = await DeviceInfo().initPlatformState();
  // appVersion = deviceInfo.appVersion.toString();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
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
