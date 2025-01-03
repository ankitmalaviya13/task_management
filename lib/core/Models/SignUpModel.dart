import 'dart:convert';

class SignUpModel {
  int status;
  String message;
  String userid;
  int otp;

  SignUpModel({
    required this.status,
    required this.message,
    required this.userid,
    required this.otp,
  });

  SignUpModel copyWith({
    int? status,
    String? message,
    String? userid,
    int? otp,
  }) =>
      SignUpModel(
        status: status ?? this.status,
        message: message ?? this.message,
        userid: userid ?? this.userid,
        otp: otp ?? this.otp,
      );

  factory SignUpModel.fromRawJson(String str) => SignUpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json["Status"],
        message: json["Message"],
        userid: json["userid"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "userid": userid,
        "otp": otp,
      };
}
