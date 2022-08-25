class ForgotPasswordResponseModel {
  ForgotPasswordResponseModel({
    required this.status,
    required this.msg,
    required this.userId,
  });
  late final int status;
  late final String msg;
  late final String userId;

  ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['userId'] = userId;
    return data;
  }
}