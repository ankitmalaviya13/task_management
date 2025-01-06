import 'dart:convert';

class ForgotModel {
  int status;
  String message;
  String userId;
  int otp;

  ForgotModel({
    required this.status,
    required this.message,
    required this.userId,
    required this.otp,
  });

  ForgotModel copyWith({
    int? status,
    String? message,
    String? userId,
    int? otp,
  }) =>
      ForgotModel(
        status: status ?? this.status,
        message: message ?? this.message,
        userId: userId ?? this.userId,
        otp: otp ?? this.otp,
      );

  factory ForgotModel.fromRawJson(String str) => ForgotModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotModel.fromJson(Map<String, dynamic> json) => ForgotModel(
        status: json["Status"],
        message: json["Message"],
        userId: json["user_id"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "user_id": userId,
        "otp": otp,
      };
}
