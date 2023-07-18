import 'dart:convert' as cnv;
import 'dart:io';
import 'package:crm/Constants/constants.dart';
import 'package:crm/Models/InvoiceModel/invoice_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceService {
  Future postInvoice(
      String supplierName,
      int amount,
      int poNumber,
      String dueDate,
      int balance,
      String paidMoneyFrom,
      String paymentMethod,
      int chequeNoOrRef,
      String invoiceDate,
      int invoiceNumber,
      int amountPaid) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token'
    };
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.newInvoice);
    final data = PostInvoiceResponseModel(
        supplierName: supplierName,
        amount: amount,
        poNumber: poNumber,
        dueDate: dueDate,
        balance: balance,
        payThisMoneyFrom: paidMoneyFrom,
        paymentMethod: paymentMethod,
        chequeNoOrRef: chequeNoOrRef,
        invoiceDate: invoiceDate,
        invoiceNumber: invoiceNumber,
        amountPaid: amountPaid);
    var response = await http.post(
      url,
      headers: requestHeaders,
      body: cnv.jsonEncode(data.toJson()),
    );
    return response.body;
  }

  Future getInvoices() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.allInvoices);
    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    List<dynamic> body = cnv.jsonDecode(response.body);
    var invoices = body
        .map((dynamic item) => InvoiceResponseModel.fromJson(item))
        .toList();
    return invoices;
  }

  Future<InvoiceResponseModel> getSingleInvoice(id) async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    Map<String, String> requestHeaders = {'Authorization': 'Token $token'};
    var url =
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.singleInvoice}/$id');
    var response = await http.get(
      url,
      headers: requestHeaders,
    );
    return InvoiceResponseModel.fromJson(cnv.jsonDecode(response.body));
  }
}
