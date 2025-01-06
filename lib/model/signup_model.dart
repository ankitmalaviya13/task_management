import 'dart:convert';

class SignupModel {
  int? status;
  String? message;
  String? userid;

  SignupModel({
    this.status,
    this.message,
    this.userid,
  });

  factory SignupModel.fromRawJson(String str) => SignupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        status: json["Status"],
        message: json["Message"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "userid": userid,
      };
}
