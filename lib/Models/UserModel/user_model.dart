// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new

import 'dart:convert';

class UserResponseModel {
  final String username;
  final String email;

  const UserResponseModel({
    required this.username,
    required this.email,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
        username: json['user']['username'], email: json['user']['email']);
  }
}

UsernameResponseModel usernameResponseJson(String str) =>
    UsernameResponseModel.fromJson(json.decode(str));

class UsernameResponseModel {
  String? username;
  String? email;

  UsernameResponseModel({this.username, this.email});

  UsernameResponseModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["user"]["username"] = this.username;
    data["user"]["email"] = this.email;
    return data;
  }
}
