import 'package:flutter/material.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/widgets/common_text.dart';

class TodayTask extends StatelessWidget {
  const TodayTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const CommonText(
          text: "Today's Task",
          fontWeight: FontWeight.w500,
          fontSize: 17,
          overflow: TextOverflow.ellipsis,
        ),
        actions: const [
          Icon(Icons.more_vert_outlined),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                        Expanded(
                          child: CommonText(
                            text: 'Client Review & Feedback',
                            fontSize: 15,
                            color: AppColor.black,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: AppColor.black,
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    CommonText(
                      text: 'Indeep Project Website',
                      color: AppColor.greyText,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                    ),
                    SizedBox(height: 10),
                    CommonText(
                      text: 'Today 10:00PM - 10:30 PM',
                      color: AppColor.black,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
