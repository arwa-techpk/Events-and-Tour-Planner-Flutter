// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

class UserModel {
  UserModel({
    this.status,
    this.data,
  });

  int status;
  Data data;

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.role,
    this.sub,
    this.nickname,
    this.name,
    this.picture,
    this.updated_at,
  });

  Role role;
  String sub;
  String nickname;
  String name;
  String picture;

  String updated_at;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        //  role: json["0"],
        sub: json["sub"],
        nickname: json["nickname"],
        name: json["name"],
        picture: json["picture"],
        updated_at: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        //   "0": role,
        "sub": sub,
        "nickname": nickname,
        "name": name,
        "picture": picture,
        "updated_at": updated_at,
      };
}

class Role {
  Role({
    this.id,
    this.name,
    this.description,
  });

  String id;
  String name;
  String description;

  factory Role.fromRawJson(String str) => Role.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
