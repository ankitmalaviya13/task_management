import 'dart:convert';

class VerifyOtpModel {
  int? status;
  String? message;
  Info? info;
  String? userToken;

  VerifyOtpModel({
    this.status,
    this.message,
    this.info,
    this.userToken,
  });

  factory VerifyOtpModel.fromRawJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
    status: json["Status"],
    message: json["Message"],
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
    userToken: json["UserToken"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "info": info?.toJson(),
    "UserToken": userToken,
  };
}

class Info {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilepic;

  Info({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profilepic,
  });

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    profilepic: json["profilepic"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "profilepic": profilepic,
  };
}
