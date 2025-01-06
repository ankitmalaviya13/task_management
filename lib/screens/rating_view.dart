import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/controllers/bottomBar_controller.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

class RatingView extends GetView<BottomBarController> {
  const RatingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const CommonText(
                text: "Rate Us",
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 50),
              RatingBar.builder(
                initialRating: controller.ratingValue.value ?? 0.0,
                glowColor: Colors.red,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                glow: true,
                unratedColor: AppColor.primaryColor.withOpacity(0.25),
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(Icons.star, color: AppColor.primaryColor),
                onRatingUpdate: (val) => controller.ratingValue.value = val,
              ),
              const SizedBox(height: 16),
              const CommonTextFieldBorder(
                hintText: "Write your feedback",
                hintTextColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
                maxLine: 3,
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 50),
              CommonButton(
                label: "Submit Feedback",
                labelColor: AppColor.white,
                labelSize: 17,
                onPressed: () {
                  controller.rateUS();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
