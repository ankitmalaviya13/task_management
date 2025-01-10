import 'dart:convert';

import 'package:task_management/model/user.dart';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  int? status;
  String? message;
  User? user;

  EditProfileModel({
    this.status,
    this.message,
    this.user,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
        status: json["Status"],
        message: json["Message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "user": user?.toJson(),
      };
}
