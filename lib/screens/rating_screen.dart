import 'package:flutter/material.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';

import '../core/color/color.dart';

class RatingScreen extends StatefulWidget {
  final void Function(double rating, String feedback)? onSubmit;

  const RatingScreen({Key? key, this.onSubmit}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 0.0;
  String _feedback = '';

  void _submitRating() {
    if (widget.onSubmit != null) {
      widget.onSubmit!(_rating, _feedback);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Rating Submitted: $_rating, Feedback: $_feedback')),
    );
  }

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        _rating = index + 1.0;
                      });
                    },
                    icon: Icon(
                      Icons.star,
                      color: index < _rating ? AppColor.primaryColor : Colors.grey,
                      size: 32,
                    ),
                  );
                }),
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
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
