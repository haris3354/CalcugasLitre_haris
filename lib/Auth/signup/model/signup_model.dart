class SignupResponse {
  SignupResponse({
    required this.status,
    required this.msg,
    required this.user,
  });
  late final int status;
  late final String msg;
  late final User user;

  SignupResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['user'] = user.toJson();
    return data;
  }
}

class User {
  late final String fullName;
  late final String userEmail;
  late final String userPassword;
  late final int verified;
  late final String id;
  late final String userAuthentication;
  late final String createdAt;
  late final String updatedAt;
  late final int v;
  User({
    required this.fullName,
    required this.userEmail,
    required this.userPassword,
    required this.verified,
    required this.id,
    required this.userAuthentication,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    verified = json['verified'];
    id = json['_id'];
    userAuthentication = json['user_authentication'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['full_name'] = fullName;
    _data['user_email'] = userEmail;
    _data['user_password'] = userPassword;
    _data['verified'] = verified;
    _data['_id'] = id;
    _data['user_authentication'] = userAuthentication;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = v;
    return _data;
  }
}
