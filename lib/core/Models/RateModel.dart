import 'dart:convert';

class RateModel {
  int status;
  String message;

  RateModel({
    required this.status,
    required this.message,
  });

  RateModel copyWith({
    int? status,
    String? message,
  }) =>
      RateModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory RateModel.fromRawJson(String str) => RateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
        status: json["Status"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
      };
}
