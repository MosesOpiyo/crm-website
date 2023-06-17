import 'dart:convert';
import 'package:crm/Constants/constants.dart';
import 'package:crm/Models/LoginModel/login_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
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
    return loginResponseJson(response.body);
  }
}
