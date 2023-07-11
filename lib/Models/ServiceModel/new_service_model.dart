class NewService {
  NewService({required this.serviceCenterName});
  late final String serviceCenterName;

  NewService.fromJson(Map<String, dynamic> json) {
    serviceCenterName = json['service_center_name'];
  }
  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['service_center_name'] = serviceCenterName;
    return _data;
  }
}
