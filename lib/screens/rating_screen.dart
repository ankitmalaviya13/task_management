import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield_border.dart';
import 'package:task_management/screens/widgets/loading_widget.dart';

import '../core/color/color.dart';
import '../providers/profile/rate_provider.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RateProvider(),
      child: RateWidget(),
    );
  }
}

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _feedbackCOntroller = TextEditingController();
    print("fshfsdf");
    return Stack(
      children: [
        Scaffold(
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
                  Selector<RateProvider, int>(
                    selector: (context, provider) => provider.rate,
                    builder: (context, rate, _) {
                      print("rate star");
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center, // Adjust size as needed
                        children: List.generate(5, (index) {
                          return IconButton(
                            onPressed: () {
                              context.read<RateProvider>().setRate(index + 1);
                            },
                            icon: Icon(
                              Icons.star,
                              color: index < rate ? AppColor.primaryColor : Colors.grey,
                              size: 32,
                            ),
                          );
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CommonTextFieldBorder(
                    con: _feedbackCOntroller,
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
                      context.read<RateProvider>().addRate(_feedbackCOntroller.text).then((v) {
                        if (v == null) {
                          Navigator.pop(context);
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Selector<RateProvider, bool>(
          selector: (context, provider) => provider.isLoading,
          builder: (context, isLoading, _) {
            print("Loader rebuilt RateProvider");
            return isLoading ? customIndicator() : const SizedBox();
          },
        ),
      ],
    );
  }
}
