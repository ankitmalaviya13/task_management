import 'package:flutter/material.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/core/constant/Assetimages.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

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
