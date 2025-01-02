import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/widgets/common_text.dart';
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
                                text: 'Pintap Project',
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
                            text: 'Wednesday 30 Nov, 2022',
                            color: AppColor.greyText,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 13,
                          ),
                          SizedBox(height: 10),
                          CommonText(
                            text: 'Website | Mobile App Design',
                            color: AppColor.black,
                            fontSize: 15,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: AppColor.black,
                                size: 18,
                              ),
                              SizedBox(width: 5),
                              CommonText(
                                text: '4 Days Ago',
                                color: AppColor.black,
                                fontSize: 15,
                              ),
                            ],
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
  }
}
