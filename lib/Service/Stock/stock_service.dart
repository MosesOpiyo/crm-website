// ignore_for_file: unused_local_variable

import 'dart:convert' as cnv;
import 'dart:io';
import 'package:crm/Constants/constants.dart';
import 'package:crm/Models/StockModel/post_stock_model.dart';
import 'package:crm/Models/StockModel/stock_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Stockservice {
  Future getStocks() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allStocks);
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    List<dynamic> body = cnv.jsonDecode(response.body);
    var sales = body
        .map((dynamic item) => SingleStockResponseModel.fromJson(item))
        .toList();
    return sales;
  }

  Future getStockValue() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allStockValue);
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    int total = 0;
    List<dynamic> body = cnv.jsonDecode(response.body);
    var sales = body
        .map((dynamic item) => SingleStockResponseModel.fromJson(item))
        .toList();
    for (var sale in sales) {
      total += sale.amount;
    }
    return [total, sales];
  }

  Future<SingleStockResponseModel> getSingleStock(id) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Map<String, String> requestHeaders = {'Authorization': 'Token $token'};
    var url =
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.singleStock}/$id');
    var response = await http.get(
      url,
      headers: requestHeaders,
    );
    return SingleStockResponseModel.fromJson(cnv.jsonDecode(response.body));
  }

  Future postStock(
      String product,
      String supplier,
      String imei,
      String checkedInPersonName,
      String warrantyDuration,
      String amount) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token'
    };
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.postStock);
    final data = StockResponseModel(
        product: product,
        supplier: supplier,
        imei: imei,
        checkedInPersonName: checkedInPersonName,
        warrantyDuration: warrantyDuration,
        amount: amount);
    var response = await http.post(
      url,
      headers: requestHeaders,
      body: cnv.jsonEncode(data.toJson()),
    );
    return response.body;
  }

  Future editStock(
      id,
      String product,
      String supplier,
      String imei,
      String checkedInPersonName,
      String warrantyDuration,
      String amount) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token'
    };
    var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.editStock}/$id');
    final data = StockResponseModel(
        product: product,
        supplier: supplier,
        imei: imei,
        checkedInPersonName: checkedInPersonName,
        warrantyDuration: warrantyDuration,
        amount: amount);
    var response = await http.put(
      url,
      headers: requestHeaders,
      body: cnv.jsonEncode(data.toJson()),
    );
    return response.body;
  }
}
