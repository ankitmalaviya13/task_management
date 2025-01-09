import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';

class ProjectView extends GetView {
  const ProjectView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: const CommonText(
          text: "Pintap Project",
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        actions: const [
          Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          SizedBox(width: 5),
          Icon(Icons.more_vert_outlined),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonText(
              text: "Create 50 Screens for mobile application",
              fontSize: 15,
            ),
            const SizedBox(height: 22),
            Column(
              children: [
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_add_alt_1, size: 16),
                            SizedBox(width: 8),
                            CommonText(
                              text: "Team",
                              fontSize: 13,
                            ),
                          ],
                        ),
                        SizedBox(height: 22),
                        Row(
                          children: [
                            Icon(Icons.person, size: 16),
                            SizedBox(width: 8),
                            CommonText(
                              text: "PM",
                              fontSize: 13,
                            ),
                          ],
                        ),
                        SizedBox(height: 22),
                        Row(
                          children: [
                            Icon(Icons.check_box_outlined, size: 16),
                            SizedBox(width: 8),
                            CommonText(
                              text: "Status",
                              fontSize: 13,
                            ),
                          ],
                        ),
                        SizedBox(height: 22),
                        Row(
                          children: [
                            Icon(Icons.calendar_month, size: 16),
                            SizedBox(width: 8),
                            CommonText(
                              text: "Due Date",
                              fontSize: 13,
                            ),
                          ],
                        ),
                        SizedBox(height: 22),
                        Row(
                          children: [
                            Icon(Icons.file_copy, size: 16),
                            SizedBox(width: 8),
                            CommonText(
                              text: "File Attach",
                              fontSize: 13,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.yellow,
                                    radius: 10,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: CircleAvatar(
                                    backgroundColor: AppColor.primaryColor,
                                    radius: 10,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 10,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 10,
                            ),
                            SizedBox(width: 6),
                            CommonText(
                              text: "John Stemberger",
                              fontSize: 11,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            CommonButton(
                              width: 50,
                              height: 22,
                              label: "To Do",
                              labelSize: 10, // Adjusted label size
                              labelColor: AppColor.white,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            CommonText(
                              text: "17 Jan, 2023",
                              fontSize: 11,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            CommonButton(
                              width: 50,
                              height: 22,
                              label: "+ Add",
                              labelSize: 10,
                              labelColor: AppColor.white,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: CommonButton(
                buttonRadius: 2.0,
                label: "Add Property",
                labelSize: 17,
                labelColor: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            const CommonText(
              text: "Sub Task",
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    padding: const EdgeInsets.all(8.0),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CommonText(
                              text: 'Client Review & Feedback',
                              fontSize: 15,
                              color: AppColor.black,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                        const CommonText(
                          text: 'Indeep Project Website',
                          color: AppColor.greyText,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 13,
                        ),
                        const SizedBox(height: 10),
                        const CommonText(
                          text: 'Today 10:00PM - 10:30 PM',
                          color: AppColor.black,
                          fontSize: 15,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Post a comment",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: AppColor.primaryColor),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
