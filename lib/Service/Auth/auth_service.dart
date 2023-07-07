import 'dart:convert';
import 'package:crm/Constants/constants.dart';
import 'package:crm/Models/LoginModel/login_model.dart';

import 'package:http/http.dart' as http;

class AuthService {
  final str = "";
  Future<LoginResponseModel> login(String username, String password) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userLogin);
    var response = await http.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"username": username, "password": password}),
    );
    if (response.statusCode == 200) {
      return loginResponseJson(response.body);
    } else {
      return loginResponseJson(str);
    }
  }
}
