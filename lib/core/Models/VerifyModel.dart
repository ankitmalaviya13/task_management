import 'dart:convert';

class VerifyModel {
  int status;
  String message;
  Info info;
  String userToken;

  VerifyModel({
    required this.status,
    required this.message,
    required this.info,
    required this.userToken,
  });

  VerifyModel copyWith({
    int? status,
    String? message,
    Info? info,
    String? userToken,
  }) =>
      VerifyModel(
        status: status ?? this.status,
        message: message ?? this.message,
        info: info ?? this.info,
        userToken: userToken ?? this.userToken,
      );

  factory VerifyModel.fromRawJson(String str) => VerifyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        status: json["Status"],
        message: json["Message"],
        info: Info.fromJson(json["info"]),
        userToken: json["UserToken"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "info": info.toJson(),
        "UserToken": userToken,
      };
}

class Info {
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
  dynamic otp;

  Info({
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
  });

  Info copyWith({
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
    dynamic otp,
  }) =>
      Info(
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
      );

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => Info(
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
      };
}
