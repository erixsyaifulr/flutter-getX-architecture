class ResponseData {
  bool? status;
  String? firstName;
  String? token;

  ResponseData({this.status, this.firstName, this.token});

  ResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    firstName = json['first_name'];
    token = json.containsKey("token") ? json['token'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['first_name'] = firstName;
    data['token'] = token;

    return data;
  }
}
