// ignore_for_file: no_leading_underscores_for_local_identifiers

class InvoiceResponseModel {
  InvoiceResponseModel({
    required this.id,
    required this.items,
    required this.documentNumber,
    required this.supplierName,
    required this.amount,
    required this.numberOfDevices,
    required this.poNumber,
    required this.dueDate,
    required this.balance,
    required this.paymentDate,
    required this.payThisMoneyFrom,
    required this.paymentMethod,
    required this.chequeNoOrRef,
    required this.invoiceDate,
    required this.invoiceNumber,
    required this.currentBalance,
    required this.amountPaid,
  });
  late final int id;
  late final List<Items> items;
  late final String documentNumber;
  late final String supplierName;
  late final int amount;
  late final int numberOfDevices;
  late final int poNumber;
  late final String dueDate;
  late final int balance;
  late final String paymentDate;
  late final String payThisMoneyFrom;
  late final String paymentMethod;
  late final int chequeNoOrRef;
  late final String invoiceDate;
  late final int invoiceNumber;
  late final int currentBalance;
  late final int amountPaid;

  InvoiceResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    documentNumber = json['document_number'];
    supplierName = json['supplier_name'];
    amount = json['amount'];
    numberOfDevices = json['number_of_devices'];
    poNumber = json['PO_number'];
    dueDate = json['due_date'];
    balance = json['balance'];
    paymentDate = json['payment_date'];
    payThisMoneyFrom = json['pay_this_money_from'];
    paymentMethod = json['payment_method'];
    chequeNoOrRef = json['cheque_no_or_ref'];
    invoiceDate = json['invoice_date'];
    invoiceNumber = json['invoice_number'];
    currentBalance = json['current_balance'];
    amountPaid = json['amount_paid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['supplier_name'] = supplierName;
    _data['amount'] = amount;
    _data['PO_number'] = poNumber;
    _data['due_date'] = dueDate;
    _data['balance'] = balance;
    _data['pay_this_money_from'] = payThisMoneyFrom;
    _data['payment_method'] = paymentMethod;
    _data['cheque_no_or_ref'] = chequeNoOrRef;
    _data['invoice_date'] = invoiceDate;
    _data['invoice_number'] = invoiceNumber;
    _data['amount_paid'] = amountPaid;
    return _data;
  }
}

class PostInvoiceResponseModel {
  PostInvoiceResponseModel({
    required this.supplierName,
    required this.amount,
    required this.poNumber,
    required this.dueDate,
    required this.balance,
    required this.payThisMoneyFrom,
    required this.paymentMethod,
    required this.chequeNoOrRef,
    required this.invoiceDate,
    required this.invoiceNumber,
    required this.amountPaid,
  });

  late final String supplierName;
  late final int amount;
  late final int poNumber;
  late final String dueDate;
  late final int balance;
  late final String payThisMoneyFrom;
  late final String paymentMethod;
  late final int chequeNoOrRef;
  late final String invoiceDate;
  late final int invoiceNumber;
  late final int amountPaid;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['supplier_name'] = supplierName;
    _data['amount'] = amount;
    _data['PO_number'] = poNumber;
    _data['due_date'] = dueDate;
    _data['balance'] = balance;
    _data['pay_this_money_from'] = payThisMoneyFrom;
    _data['payment_method'] = paymentMethod;
    _data['cheque_no_or_ref'] = chequeNoOrRef;
    _data['invoice_date'] = invoiceDate;
    _data['invoice_number'] = invoiceNumber;
    _data['amount_paid'] = amountPaid;
    return _data;
  }
}

class Items {
  Items({
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

  Items.fromJson(Map<String, dynamic> json) {
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
    _data['id'] = id;
    _data['product'] = product;
    _data['supplier'] = supplier;
    _data['imei'] = imei;
    _data['checked_in_person_name'] = checkedInPersonName;
    _data['warranty_duration'] = warrantyDuration;
    _data['amount'] = amount;
    return _data;
  }
}
