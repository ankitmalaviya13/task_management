import 'dart:convert';

class ForgotPasswordModel {
  int? status;
  String? message;
  String? userId;

  ForgotPasswordModel({
    this.status,
    this.message,
    this.userId,
  });

  factory ForgotPasswordModel.fromRawJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
        status: json["Status"],
        message: json["Message"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "user_id": userId,
      };
}
