import 'dart:convert';
import 'dart:io';
import 'package:crm/Constants/constants.dart';
import 'package:crm/Models/UserModel/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Userservice {
  var client = http.Client();

  Future<UserResponseModel> getProfile() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userProfile);

    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    if (response.statusCode == 200) {
      return UserResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
