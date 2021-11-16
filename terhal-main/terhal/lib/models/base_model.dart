// To parse this JSON data, do
//
//     final baseModel = baseModelFromJson(jsonString);

import 'dart:convert';

class BaseModel {
  BaseModel({
    this.status,
  });

  int status;

  factory BaseModel.fromRawJson(String str) =>
      BaseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
