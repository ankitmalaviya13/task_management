import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_management/core/color/color.dart';
import 'package:uuid/uuid.dart';

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

customIndicator() {
  return Container(
    height: Get.height,
    width: Get.width,
    color: Colors.transparent,
    child: const Center(
      child: CircularProgressIndicator(
        color: AppColor.black,
      ),
    ),
  );
}

class Toasty {
  static showtoast(String message) {
    message.isNotEmpty
        ? Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.5),
          )
        : Container();
  }
}

class ConstantsVariables {
  //api variables
  static const String token = "token";
  static const String userId = "userId";
  static const String fullName = "name";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String email = "email";
  static const String phone = "phone";

  static String deviceToken = Uuid().v4();
}

GetStorage box = GetStorage();
getLoginSignupData custom = getLoginSignupData();

RxBool noInternetConnection = false.obs;

class getLoginSignupData {
  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var latLong = {
      "latitude": position.latitude,
      "longitude": position.longitude,
    };
    return latLong;
  }
}

deviceInfo() async {
  var deviceInfo = DeviceInfoPlugin();
  var data;
  if (Platform.isIOS) {
    // deviceType = 2;
    var iosDeviceInfo = await deviceInfo.iosInfo;

    data = {
      "deviceType": 2,
      "deviceId": iosDeviceInfo.identifierForVendor,
    };
  } else {
    // deviceType = 1;
    var androidDeviceInfo = await deviceInfo.androidInfo;

    data = {
      "deviceType": 1,
      "deviceId": androidDeviceInfo.id,
    };
  }
  return data;
}
