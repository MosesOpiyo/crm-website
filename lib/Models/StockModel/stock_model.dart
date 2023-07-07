// ignore_for_file: no_leading_underscores_for_local_identifiers

class SingleStockResponseModel {
  SingleStockResponseModel({
    required this.id,
    required this.product,
    required this.supplier,
    required this.imei,
    required this.checkedInPersonName,
    required this.warrantyDuration,
    required this.amount,
  });
  late final int id;
  late final String product;
  late final String supplier;
  late final int imei;
  late final String checkedInPersonName;
  late final String warrantyDuration;
  late final int amount;

  SingleStockResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    supplier = json['supplier'];
    imei = json['imei'];
    checkedInPersonName = json['checked_in_person_name'];
    warrantyDuration = json['warranty_duration'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product'] = product;
    _data['supplier'] = supplier;
    _data['imei'] = imei;
    _data['checked_in_person_name'] = checkedInPersonName;
    _data['warranty_duration'] = warrantyDuration;
    _data['amount'] = amount;
    return _data;
  }
}
