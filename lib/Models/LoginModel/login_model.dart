// ignore_for_file: prefer_collection_literals, unnecessary_this, unnecessary_new

import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  String? token;
  String? username;
  String? email;

  LoginResponseModel({
    this.token,
    this.email,
    this.username,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["token"] = this.token;
    data["user"]["username"] = this.username;
    data["user"]["email"] = this.email;

    return data;
  }
}
