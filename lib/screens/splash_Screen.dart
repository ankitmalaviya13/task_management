import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await splashProvider.initializeApp();

      if (splashProvider.isAuthenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomBarScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
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
      body: Column(
        children: [
          Container(
            color: AppColor.primaryColor,
            height: screenHeight,
            width: screenWidth,
            child: Image.asset(
              AppAssetImage.logo,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
