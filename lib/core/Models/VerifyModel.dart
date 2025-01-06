import 'dart:convert';

class VerifyModel {
  int status;
  String message;

  VerifyModel({
    required this.status,
    required this.message,
  });

  VerifyModel copyWith({
    int? status,
    String? message,
  }) =>
      VerifyModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory VerifyModel.fromRawJson(String str) => VerifyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        status: json["Status"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
      };
}

class Info {
  String id;
  String firstName;
  String lastName;
  String profilepic;
  String email;

  Info({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profilepic,
    required this.email,
  });

  Info copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? profilepic,
    String? email,
  }) =>
      Info(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        profilepic: profilepic ?? this.profilepic,
        email: email ?? this.email,
      );

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilepic: json["profilepic"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "profilepic": profilepic,
        "email": email,
      };
}
