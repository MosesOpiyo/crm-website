class StockResponseModel {
  StockResponseModel({
    required this.product,
    required this.supplier,
    required this.imei,
    required this.checkedInPersonName,
    required this.warrantyDuration,
    required this.amount,
  });
  late final String product;
  late final String supplier;
  late final String imei;
  late final String checkedInPersonName;
  late final String warrantyDuration;
  late final String amount;

  StockResponseModel.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    supplier = json['supplier'];
    imei = json['imei'];
    checkedInPersonName = json['checked_in_person_name'];
    warrantyDuration = json['warranty_duration'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['product'] = product;
    data['supplier'] = supplier;
    data['imei'] = imei;
    data['checked_in_person_name'] = checkedInPersonName;
    data['warranty_duration'] = warrantyDuration;
    data['amount'] = amount;
    return data;
  }
}
