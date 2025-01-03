// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? status;
  String? message;
  User? user;
  String? userToken;

  LoginModel({
    this.status,
    this.message,
    this.user,
    this.userToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["Status"],
        message: json["Message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        userToken: json["UserToken"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "user": user?.toJson(),
        "UserToken": userToken,
      };
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  bool? emailverified;
  String? role;
  String? logintype;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? otp;
  dynamic resettoken;
  dynamic resettokentime;
  String? profilepic;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.emailverified,
    this.role,
    this.logintype,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.otp,
    this.resettoken,
    this.resettokentime,
    this.profilepic,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        emailverified: json["emailverified"],
        role: json["role"],
        logintype: json["logintype"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        otp: json["otp"],
        resettoken: json["resettoken"],
        resettokentime: json["resettokentime"],
        profilepic: json["profilepic"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "emailverified": emailverified,
        "role": role,
        "logintype": logintype,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "otp": otp,
        "resettoken": resettoken,
        "resettokentime": resettokentime,
        "profilepic": profilepic,
      };
}
