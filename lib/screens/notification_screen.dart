import 'package:flutter/material.dart';
import 'package:task_management/screens/widgets/cacheNetworkImage.dart';
import 'package:task_management/screens/widgets/common_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CommonText(
          text: "Notifications",
          fontWeight: FontWeight.w500,
          fontSize: 22.0,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cachedNetworkImage(
                        circular: 100.0,
                        image: "https://picsum.photos/200/300",
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.fill,
                        clipRRectBorderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "You've invited the project",
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CommonText(
                            text: "Some one is invited you to in this project",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CommonText(text: DateTime.now().toString()),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
