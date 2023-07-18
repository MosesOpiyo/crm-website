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

  Future getSalesAtShop() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allSalesAtShop);
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    List<dynamic> body = cnv.jsonDecode(response.body);
    var sales =
        body.map((dynamic item) => SaleResponseModel.fromJson(item)).toList();
    return sales;
  }

  Future getSalesClients() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allSalesClients);
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    List<dynamic> body = cnv.jsonDecode(response.body);
    var sales = body.map((dynamic item) => item).toList();
    return sales;
  }

  Future getSalesValue() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allSales);
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    List<dynamic> body = cnv.jsonDecode(response.body);
    int totalSales = 0;
    var sales =
        body.map((dynamic item) => SaleResponseModel.fromJson(item)).toList();

    for (var sale in sales) {
      totalSales += (sale.cash + sale.mpesa + sale.invoicedAmount);
    }
    return [totalSales];
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

  Future postSale(
      String product,
      String supplier,
      int imei,
      bool pickedAtShop,
      String deliveredBy,
      String clientName,
      int clientPhoneNumber,
      String clientEmail,
      String clientLocation,
      String clientPin,
      String soldBy,
      String status,
      String warrantyStatus,
      int cash,
      int mpesa,
      int invoicedAmount,
      String expenseName,
      int expenseAmount) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token'
    };
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.newSale);
    final data = SingleSaleResponseModel(
      product: product,
      supplier: supplier,
      imei: imei,
      pickedAtShop: pickedAtShop,
      deliveredBy: deliveredBy,
      clientName: clientName,
      clientEmail: clientEmail,
      clientPhoneNumber: clientPhoneNumber,
      clientLocation: clientLocation,
      clientPin: clientPin,
      soldBy: soldBy,
      status: status,
      warrantyStatus: warrantyStatus,
      cash: cash,
      mpesa: mpesa,
      invoicedAmount: invoicedAmount,
      expenseName: expenseName,
      expenseAmount: expenseAmount,
    );
    var response = await http.post(
      url,
      headers: requestHeaders,
      body: cnv.jsonEncode(data.toJson()),
    );
    return response.body;
  }

  Future editSale(
      id,
      String product,
      String supplier,
      int imei,
      bool pickedAtShop,
      String deliveredBy,
      String clientName,
      int clientPhoneNumber,
      String clientEmail,
      String clientLocation,
      String clientPin,
      String soldBy,
      String status,
      String warrantyStatus,
      int cash,
      int mpesa,
      int invoicedAmount,
      String expenseName,
      int expenseAmount) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token'
    };

    var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.editSale}/$id');
    final data = SingleSaleResponseModel(
      product: product,
      supplier: supplier,
      imei: imei,
      pickedAtShop: pickedAtShop,
      deliveredBy: deliveredBy,
      clientName: clientName,
      clientEmail: clientEmail,
      clientPhoneNumber: clientPhoneNumber,
      clientLocation: clientLocation,
      clientPin: clientPin,
      soldBy: soldBy,
      status: status,
      warrantyStatus: warrantyStatus,
      cash: cash,
      mpesa: mpesa,
      invoicedAmount: invoicedAmount,
      expenseName: expenseName,
      expenseAmount: expenseAmount,
    );

    var response = await http.put(
      url,
      headers: requestHeaders,
      body: cnv.jsonEncode(data.toJson()),
    );
    return response.body;
  }
}
