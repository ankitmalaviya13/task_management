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

  String profilepic;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profilepic,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? profilepic,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        profilepic: profilepic ?? this.profilepic,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        profilepic: json["profilepic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "profilepic": profilepic,
      };
}
