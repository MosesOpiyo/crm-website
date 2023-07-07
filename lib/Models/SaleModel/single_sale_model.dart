// ignore_for_file: no_leading_underscores_for_local_identifiers

class SingleSaleResponseModel {
  SingleSaleResponseModel({
    required this.product,
    required this.supplier,
    required this.imei,
    required this.pickedAtShop,
    required this.deliveredBy,
    required this.clientName,
    required this.clientPhoneNumber,
    required this.clientEmail,
    required this.clientLocation,
    required this.clientPin,
    required this.soldBy,
    required this.status,
    required this.warrantyStatus,
    required this.cash,
    required this.mpesa,
    required this.invoicedAmount,
    required this.expenseName,
    required this.expenseAmount,
  });
  late final String product;
  late final String supplier;
  late final int imei;
  late final bool pickedAtShop;
  late final String deliveredBy;
  late final String clientName;
  late final int clientPhoneNumber;
  late final String clientEmail;
  late final String clientLocation;
  late final String clientPin;
  late final String soldBy;
  late final String status;
  late final String warrantyStatus;
  late final int cash;
  late final int mpesa;
  late final int invoicedAmount;
  late final String expenseName;
  late final int expenseAmount;

  SingleSaleResponseModel.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    supplier = json['supplier'];
    imei = json['imei'];
    pickedAtShop = json['picked_at_shop'];
    deliveredBy = json['delivered_to_client_by'];
    clientName = json['client_name'];
    clientPhoneNumber = json['client_phone_number'];
    clientEmail = json['client_email'];
    clientLocation = json['client_location'];
    clientPin = json['client_pin'];
    soldBy = json['sold_by'];
    status = json['status'];
    warrantyStatus = json['warranty_status'];
    cash = json['cash'];
    mpesa = json['mpesa'];
    invoicedAmount = json['invoiced_amount'];
    expenseName = json['expense_name'];
    expenseAmount = json['expense_amount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product'] = product;
    _data['supplier'] = supplier;
    _data['imei'] = imei;
    _data['picked_at_shop'] = pickedAtShop;
    _data['delivered_to_client_by'] = deliveredBy;
    _data['client_name'] = clientName;
    _data['client_phone_number'] = clientPhoneNumber;
    _data['client_email'] = clientEmail;
    _data['client_location'] = clientLocation;
    _data['client_pin'] = clientPin;
    _data['sold_by'] = soldBy;
    _data['status'] = status;
    _data['warranty_status'] = warrantyStatus;
    _data['cash'] = cash;
    _data['mpesa'] = mpesa;
    _data['invoiced_amount'] = invoicedAmount;
    _data['expense_name'] = expenseName;
    _data['expense_amount'] = expenseAmount;
    return _data;
  }
}
