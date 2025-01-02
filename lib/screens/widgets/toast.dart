import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_management/core/color/color.dart';

class Toasty {
  static showtoast(String message) {
    message.isNotEmpty
        ? Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: AppColor.white,
            backgroundColor: AppColor.black.withOpacity(0.5),
          )
        : Container();
  }
}
