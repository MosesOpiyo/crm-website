import 'dart:convert' as cnv;
import 'dart:io';
import 'package:crm/Constants/constants.dart';
import 'package:crm/Models/SaleModel/sale_model.dart';
import 'package:crm/Models/SaleModel/single_sale_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Salesservice {
  Future getSales() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allSales);
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    List<dynamic> body = cnv.jsonDecode(response.body);
    var sales =
        body.map((dynamic item) => SaleResponseModel.fromJson(item)).toList();
    return sales;
  }

  Future<SingleSaleResponseModel> getSingleSale(id) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Map<String, String> requestHeaders = {'Authorization': 'Token $token'};
    var url =
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.singleSale}/$id');
    var response = await http.get(
      url,
      headers: requestHeaders,
    );
    return SingleSaleResponseModel.fromJson(cnv.jsonDecode(response.body));
  }

  Future postSale(product) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.newSales);
    var response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: "Token $token",
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: cnv.jsonEncode({"product": product}));
    return response.statusCode;
  }
}
