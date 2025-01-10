import 'dart:convert';

import 'package:task_management/model/user.dart';

class LoginModel {
  int? status;
  String? message;
  User? user;
  String? userToken;

  LoginModel({
    this.status,
    this.message,
    this.user,
    this.userToken,
  });

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["Status"],
        message: json["Message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        userToken: json["UserToken"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "user": user?.toJson(),
        "UserToken": userToken,
      };
}
