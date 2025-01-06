import 'dart:convert';

class ChangePasswordModel {
  String? message;
  bool? status;

  ChangePasswordModel({
    this.message,
    this.status,
  });

  factory ChangePasswordModel.fromRawJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
