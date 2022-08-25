class LoginResponseModel {
  final int? status;
  final String? msg;
  final User? user;

  LoginResponseModel({
    this.status,
    this.msg,
    this.user,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        msg = json['msg'] as String?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'status': status, 'msg': msg, 'user': user?.toJson()};
}

class User {
  final String? id;
  final String? fullName;
  final String? userEmail;
  final String? userPassword;
  final String? image;
  final int? code;
  final int? verified;
  final String? userAuthentication;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  User({
    this.id,
    this.fullName,
    this.userEmail,
    this.userPassword,
    this.image,
    this.code,
    this.verified,
    this.userAuthentication,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        fullName = json['full_name'] as String?,
        userEmail = json['user_email'] as String?,
        userPassword = json['user_password'] as String?,
        image = json['image'] as String?,
        code = json['code'] as int?,
        verified = json['verified'] as int?,
        userAuthentication = json['user_authentication'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'full_name': fullName,
        'user_email': userEmail,
        'user_password': userPassword,
        'image': image,
        'code': code,
        'verified': verified,
        'user_authentication': userAuthentication,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}
