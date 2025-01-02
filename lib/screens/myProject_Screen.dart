import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/widgets/common_textfield.dart';

class MyProjectScreen extends StatefulWidget {
  const MyProjectScreen({super.key});

  @override
  State<MyProjectScreen> createState() => _MyProjectScreenState();
}

class _MyProjectScreenState extends State<MyProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
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
          ],
        ),
      ),
    );
  }
}
