import 'dart:convert';

class Project {
  int status;
  String message;
  List<ProjectElement> projects;

  Project({
    required this.status,
    required this.message,
    required this.projects,
  });

  Project copyWith({
    int? status,
    String? message,
    List<ProjectElement>? projects,
  }) =>
      Project(
        status: status ?? this.status,
        message: message ?? this.message,
        projects: projects ?? this.projects,
      );

  factory Project.fromRawJson(String str) => Project.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        status: json["Status"],
        message: json["Message"],
        projects: List<ProjectElement>.from(json["projects"].map((x) => ProjectElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
      };
}

class ProjectElement {
  String id;
  String name;
  String visibility;
  AddedBy addedBy;
  List<AddedBy> members;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  ProjectElement({
    required this.id,
    required this.name,
    required this.visibility,
    required this.addedBy,
    required this.members,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  ProjectElement copyWith({
    String? id,
    String? name,
    String? visibility,
    AddedBy? addedBy,
    List<AddedBy>? members,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      ProjectElement(
        id: id ?? this.id,
        name: name ?? this.name,
        visibility: visibility ?? this.visibility,
        addedBy: addedBy ?? this.addedBy,
        members: members ?? this.members,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory ProjectElement.fromRawJson(String str) => ProjectElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProjectElement.fromJson(Map<String, dynamic> json) => ProjectElement(
        id: json["_id"],
        name: json["name"],
        visibility: json["visibility"],
        addedBy: AddedBy.fromJson(json["AddedBy"]),
        members: List<AddedBy>.from(json["members"].map((x) => AddedBy.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "visibility": visibility,
        "AddedBy": addedBy.toJson(),
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class AddedBy {
  String id;
  String firstName;
  String lastName;
  String email;

  AddedBy({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  AddedBy copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
  }) =>
      AddedBy(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
      );

  factory AddedBy.fromRawJson(String str) => AddedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
      };
}
