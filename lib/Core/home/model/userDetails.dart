class UserDetails {
  int? status;
  String? message;
  User? user;

  UserDetails({this.status, this.message, this.user});

  UserDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? fullName;
  String? userEmail;
  String? image;

  User({this.sId, this.fullName, this.userEmail, this.image});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['full_name'];
    userEmail = json['user_email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['full_name'] = fullName;
    data['user_email'] = userEmail;
    data['image'] = image;
    return data;
  }
}
