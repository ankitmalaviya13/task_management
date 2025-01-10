// To parse this JSON data, do
//
//     final getUsersModel = getUsersModelFromJson(jsonString);

import 'dart:convert';

import 'package:task_management/model/user.dart';

GetUsersModel getUsersModelFromJson(String str) => GetUsersModel.fromJson(json.decode(str));

String getUsersModelToJson(GetUsersModel data) => json.encode(data.toJson());

class GetUsersModel {
  int? status;
  String? message;
  List<User>? info;

  GetUsersModel({
    this.status,
    this.message,
    this.info,
  });

  factory GetUsersModel.fromJson(Map<String, dynamic> json) => GetUsersModel(
        status: json["Status"],
        message: json["Message"],
        info: json["info"] == null ? [] : List<User>.from(json["info"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "info": info == null ? [] : List<dynamic>.from(info!.map((x) => x.toJson())),
      };
}
