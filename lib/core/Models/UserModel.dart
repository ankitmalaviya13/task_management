import 'dart:convert';

class UserModel {
  int status;
  String message;
  User user;

  UserModel({
    required this.status,
    required this.message,
    required this.user,
  });

  UserModel copyWith({
    int? status,
    String? message,
    User? user,
  }) =>
      UserModel(
        status: status ?? this.status,
        message: message ?? this.message,
        user: user ?? this.user,
      );

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["Status"],
        message: json["Message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "user": user.toJson(),
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
