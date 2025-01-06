import 'dart:convert';

class LogoutModel {
  int? status;
  String? message;

  LogoutModel({
    this.status,
    this.message,
  });

  factory LogoutModel.fromRawJson(String str) => LogoutModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
    status: json["Status"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
  };
}
