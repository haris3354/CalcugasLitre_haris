import 'package:get/get.dart';

class UserGuideLinesModel {
  final int? status;
  final List<GuideLines>? message;

  UserGuideLinesModel({
    this.status,
    this.message,
  });

  UserGuideLinesModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = (json['message'] as List?)
            ?.map((dynamic e) => GuideLines.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message?.map((e) => e.toJson()).toList()};
}

class GuideLines {
  final String? id;
  final String? title;
  final String? content;
  final String? type;
  final int? v;
  final String? createdAt;
  final String? updatedAt;

  GuideLines({
    this.id,
    this.title,
    this.content,
    this.type,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  GuideLines.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        title = json['title'] as String?,
        content = json['content'] as String?,
        type = json['type'] as String?,
        v = json['__v'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'content': content,
        'type': type,
        '__v': v,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
