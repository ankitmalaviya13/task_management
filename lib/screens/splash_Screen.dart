import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/providers/Authentication/auth_provider.dart';

import '../core/color/color.dart';
import '../core/constant/Assetimages.dart';
import '../providers/splash_provider.dart';
import 'bottomBar_Screen.dart';
import 'login_Screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await splashProvider.initializeApp(authProvider);

      if (splashProvider.isAuthenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomBarScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: AppColor.primaryColor,
        height: screenHeight,
        width: screenWidth,
        child: Image.asset(
          AppAssetImage.logo,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
