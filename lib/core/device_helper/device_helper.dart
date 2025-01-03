import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoHelper {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static Future<Map<String, String>> getDeviceInfo() async {
    String deviceId = '';
    String deviceType = '';

    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      deviceId = androidInfo.id; // Unique device ID
      deviceType = "Android"; // Device type
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? ''; // Unique device ID
      deviceType = "iOS"; // Device type
    }

    return {
      "deviceId": deviceId,
      "deviceType": deviceType,
    };
  }
}

class LoginDeviceHelper {
  static Future<Map<String, String?>> getLoginDeviceDetails() async {
    Map<String, String> deviceInfo = await DeviceInfoHelper.getDeviceInfo();
    String? deviceToken = await DeviceTokenHelper.getDeviceToken();

    return {
      "deviceId": deviceInfo["deviceId"],
      "deviceType": deviceInfo["deviceType"],
      "deviceToken": deviceToken,
    };
  }
}

class DeviceTokenHelper {
  static Future<String?> getDeviceToken() async {
    try {
      // FirebaseMessaging messaging = FirebaseMessaging.instance;
      // String? token = await messaging.getToken();
      // return token;
      return "Gdfgjhgdk";
    } catch (e) {
      print("Error fetching device token: $e");
      return null;
    }
  }
}
