class ResetPasswordModel {
  ResetPasswordModel({
    required this.status,
    required this.message,
  });
  late final int status;
  late final String message;

  ResetPasswordModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}