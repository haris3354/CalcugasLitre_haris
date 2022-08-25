class SocialLoginResponse {
  final int? status;
  final String? message;
  final String? token;
  final User? user;

  SocialLoginResponse({
    this.status,
    this.message,
    this.token,
    this.user,
  });

  SocialLoginResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        token = json['token'] as String?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'token': token,
        'user': user?.toJson()
      };
}

class User {
  final String? id;
  final String? image;
  final int? verified;
  final String? userSocialToken;
  final String? userSocialType;
  final String? userDeviceType;
  final String? userDeviceToken;
  final String? userAuthentication;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? fullName;

  User({
    this.id,
    this.image,
    this.verified,
    this.userSocialToken,
    this.userSocialType,
    this.userDeviceType,
    this.userDeviceToken,
    this.userAuthentication,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.fullName,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        image = json['image'] as String?,
        verified = json['verified'] as int?,
        userSocialToken = json['user_social_token'] as String?,
        userSocialType = json['user_social_type'] as String?,
        userDeviceType = json['user_device_type'] as String?,
        userDeviceToken = json['user_device_token'] as String?,
        userAuthentication = json['user_authentication'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?,
        fullName = json['full_name'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'image': image,
        'verified': verified,
        'user_social_token': userSocialToken,
        'user_social_type': userSocialType,
        'user_device_type': userDeviceType,
        'user_device_token': userDeviceToken,
        'user_authentication': userAuthentication,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
        'full_name': fullName
      };
}
