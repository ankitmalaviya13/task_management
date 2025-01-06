import 'dart:convert';

class ResetPasswordModel {
  int? status;
  String? message;

  ResetPasswordModel({
    this.status,
    this.message,
  });

  factory ResetPasswordModel.fromRawJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
    status: json["Status"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
  };
}
