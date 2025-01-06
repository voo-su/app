import 'dart:convert';

import 'package:voo_su/domain/entities/auth.dart';

AuthLoginModel loginModelFromJson(String str) =>
    AuthLoginModel.fromJson(json.decode(str));

String loginModelToJson(AuthLoginModel data) => json.encode(data.toJson());

class AuthLoginModel extends AuthLogin {
  const AuthLoginModel({
    required super.expiresIn,
    required super.token,
  });

  factory AuthLoginModel.fromJson(Map<String, dynamic> json) => AuthLoginModel(
        expiresIn: json["expiresIn"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "expiresIn": expiresIn,
        "token": token,
      };
}

AuthVerifyModel verifyModelFromJson(String str) =>
    AuthVerifyModel.fromJson(json.decode(str));

String verifyModelToJson(AuthVerifyModel data) => json.encode(data.toJson());

class AuthVerifyModel extends AuthVerify {
  const AuthVerifyModel({
    required super.accessToken,
    required super.expiresIn,
    required super.type,
  });

  factory AuthVerifyModel.fromJson(Map<String, dynamic> json) =>
      AuthVerifyModel(
        accessToken: json["accessToken"],
        expiresIn: json["expiresIn"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "expiresIn": expiresIn,
        "type": type,
      };
}
