import 'dart:convert';

class LoginModel {
  int status;
  String message;
  User user;
  String userToken;

  LoginModel({
    required this.status,
    required this.message,
    required this.user,
    required this.userToken,
  });

  LoginModel copyWith({
    int? status,
    String? message,
    User? user,
    String? userToken,
  }) =>
      LoginModel(
        status: status ?? this.status,
        message: message ?? this.message,
        user: user ?? this.user,
        userToken: userToken ?? this.userToken,
      );

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["Status"],
        message: json["Message"],
        user: User.fromJson(json["user"]),
        userToken: json["UserToken"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "user": user.toJson(),
        "UserToken": userToken,
      };
}

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  bool emailverified;
  String role;
  String logintype;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String otp;
  dynamic resettoken;
  dynamic resettokentime;
  String profilepic;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.emailverified,
    required this.role,
    required this.logintype,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.otp,
    required this.resettoken,
    required this.resettokentime,
    required this.profilepic,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    bool? emailverified,
    String? role,
    String? logintype,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? otp,
    dynamic resettoken,
    dynamic resettokentime,
    String? profilepic,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        emailverified: emailverified ?? this.emailverified,
        role: role ?? this.role,
        logintype: logintype ?? this.logintype,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        otp: otp ?? this.otp,
        resettoken: resettoken ?? this.resettoken,
        resettokentime: resettokentime ?? this.resettokentime,
        profilepic: profilepic ?? this.profilepic,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        emailverified: json["emailverified"],
        role: json["role"],
        logintype: json["logintype"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "otp": otp,
        "resettoken": resettoken,
        "resettokentime": resettokentime,
        "profilepic": profilepic,
      };
}
