import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/screens/notification_screen.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield.dart';

import '../core/color/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBNFUwQmH640OafdOvh-eIPRcB9ZeIBbYfew&s'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Hey",
                      fontSize: 15,
                    ),
                    CommonText(
                      text: "Shane Watson",
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationScreen()));
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
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
            const SizedBox(height: 25),
            const Row(
              children: [
                CommonText(
                  text: "My Projects",
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                CommonText(
                  text: "View All",
                  fontSize: 17,
                  color: AppColor.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 10),
            // SizedBox(
            //   height: 150,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 10,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         margin: const EdgeInsets.only(right: 10),
            //         width: 120,
            //         decoration: BoxDecoration(
            //           color: AppColor.primaryColor,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: const Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             CommonText(
            //               text: 'Pintap Project',
            //               fontSize: 14,
            //               color: Colors.white,
            //               fontWeight: FontWeight.w500,
            //             ),
            //             SizedBox(height: 10),
            //             CommonText(
            //               text: 'Wednesday 30 NOV, 2022',
            //               color: Colors.white,
            //               fontSize: 10,
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(height: 20),
            const Row(
              children: [
                CommonText(
                  text: "Today's Task",
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                CommonText(
                  text: "View All",
                  fontSize: 17,
                  color: AppColor.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
