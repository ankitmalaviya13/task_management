import 'dart:convert';

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

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  String? profilepic;
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  User({
    this.profilepic,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    profilepic: json["profilepic"],
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "profilepic": profilepic,
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
  };
}
