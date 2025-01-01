import 'package:flutter/material.dart';
import 'package:task_management/core/color/color.dart';

class ProgressView extends StatelessWidget {
  Color? color;

  ProgressView({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: CircularProgressIndicator(
          color: color ?? AppColor.black,
        ),
      ),
    );
  }
}
