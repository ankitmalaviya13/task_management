import 'dart:convert';

import 'package:task_management/model/user.dart';

class VerifyOtpModel {
  int? status;
  String? message;
  User? info;
  String? userToken;

  VerifyOtpModel({
    this.status,
    this.message,
    this.info,
    this.userToken,
  });

  factory VerifyOtpModel.fromRawJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
        status: json["Status"],
        message: json["Message"],
        info: json["info"] == null ? null : User.fromJson(json["info"]),
        userToken: json["UserToken"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "info": info?.toJson(),
        "UserToken": userToken,
      };
}
