// ignore_for_file: no_leading_underscores_for_local_identifiers

class SaleResponseModel {
  SaleResponseModel({
    required this.id,
    required this.product,
    required this.supplier,
    required this.imei,
    required this.deliveredBy,
    required this.clientName,
    required this.status,
    required this.cash,
    required this.mpesa,
    required this.invoicedAmount,
  });
  late final int id;
  late final String product;
  late final String supplier;
  late final int imei;
  late final String deliveredBy;
  late final String clientName;
  late final String status;
  late final int cash;
  late final int mpesa;
  late final int invoicedAmount;

  SaleResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    supplier = json['supplier'];
    imei = json['imei'];
    deliveredBy = json['delivered_to_client_by'];
    clientName = json['client_name'];
    status = json['status'];
    cash = json['cash'];
    mpesa = json['mpesa'];
    invoicedAmount = json['invoiced_amount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product'] = product;
    _data['supplier'] = supplier;
    _data['imei'] = imei;
    _data['delivered_to_client_by'] = deliveredBy;
    _data['client_name'] = clientName;
    _data['status'] = status;
    _data['cash'] = cash;
    _data['mpesa'] = mpesa;
    _data['invoiced_amount'] = invoicedAmount;
    return _data;
  }
}
