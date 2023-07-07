// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:crm/Models/StockModel/stock_model.dart';

class ServiceCenterResponseModel {
  ServiceCenterResponseModel({
    required this.id,
    required this.devices,
    required this.serviceCenterName,
  });
  late final int id;
  late final List<Devices> devices;
  late final String serviceCenterName;

  ServiceCenterResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    devices =
        List.from(json['devices']).map((e) => Devices.fromJson(e)).toList();
    serviceCenterName = json['service_center_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['devices'] = devices.map((e) => e.toJson()).toList();
    _data['service_center_name'] = serviceCenterName;
    return _data;
  }
}

class Devices {
  Devices({
    required this.id,
    required this.comment,
    required this.userDamage,
    required this.userDamageComment,
    required this.amount,
    required this.takenBy,
    required this.takenDate,
    required this.issue,
    required this.serviceCenterFeedback,
    required this.status,
    required this.device,
  });
  late final int id;
  late final List<Comment> comment;
  late final String userDamage;
  late final String userDamageComment;
  late final int amount;
  late final String takenBy;
  late final String takenDate;
  late final String issue;
  late final String serviceCenterFeedback;
  late final String status;
  late final SingleStockResponseModel device;

  Devices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment =
        List.from(json['comment']).map((e) => Comment.fromJson(e)).toList();
    userDamage = json['user_damage'];
    userDamageComment = json['user_damage_comment'];
    amount = json['amount'];
    takenBy = json['taken_by'];
    takenDate = json['taken_date'];
    issue = json['issue'];
    serviceCenterFeedback = json['service_center_feedback'];
    status = json['status'];
    device = SingleStockResponseModel.fromJson(json['device']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['comment'] = comment.map((e) => e.toJson()).toList();
    _data['user_damage'] = userDamage;
    _data['user_damage_comment'] = userDamageComment;
    _data['amount'] = amount;
    _data['taken_by'] = takenBy;
    _data['taken_date'] = takenDate;
    _data['issue'] = issue;
    _data['service_center_feedback'] = serviceCenterFeedback;
    _data['status'] = status;
    _data['device'] = device;
    return _data;
  }
}

class Comment {
  Comment({
    required this.comment,
  });
  late final String comment;

  Comment.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['comment'] = comment;
    return _data;
  }
}
