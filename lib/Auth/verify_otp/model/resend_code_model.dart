class ResendCodeModel {
  ResendCodeModel({
    required this.status,
    required this.message,
    required this.code,
  });
  late final int status;
  late final String message;
  late final int code;

  ResendCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['code'] = code;
    return _data;
  }
}
