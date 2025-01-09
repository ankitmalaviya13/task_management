import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  int? status;
  String? message;
  User? user;

  EditProfileModel({
    this.status,
    this.message,
    this.user,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
        status: json["Status"],
        message: json["Message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "user": user?.toJson(),
      };
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilepic;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profilepic,
  });

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
