import 'dart:convert' as cnv;
import 'dart:io';
import 'package:crm/Constants/constants.dart';
import 'package:crm/Models/ServiceModel/service_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Serviceservice {
  Future getServiceCenters() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.serviceCenters);
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    List<dynamic> body = cnv.jsonDecode(response.body);
    var centers = body
        .map((dynamic item) => ServiceCenterResponseModel.fromJson(item))
        .toList();

    return centers;
  }

  Future<ServiceCenterResponseModel> getServiceCenter(id) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url =
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.singleCenter}/$id');
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    return ServiceCenterResponseModel.fromJson(cnv.jsonDecode(response.body));
  }

  Future<Devices> getDevice(id) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url =
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.singleDevice}/$id');
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    return Devices.fromJson(cnv.jsonDecode(response.body));
  }
}
