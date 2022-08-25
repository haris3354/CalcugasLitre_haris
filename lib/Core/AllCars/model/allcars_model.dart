class AllCarsResponseModel {
  final int? status;
  final String? message;
  final List<Cars>? cars;

  AllCarsResponseModel({
    this.status,
    this.message,
    this.cars,
  });

  AllCarsResponseModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        cars = (json['data'] as List?)
            ?.map((dynamic e) => Cars.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': cars?.map((e) => e.toJson()).toList()
      };
}

class Cars {
  final String? id;
  final String? carName;
  final String? carNumber;
  final String? carModel;
  final String? carImage;
  final String? userId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Cars({
    this.id,
    this.carName,
    this.carNumber,
    this.carModel,
    this.carImage,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Cars.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        carName = json['carName'] as String?,
        carNumber = json['carNumber'] as String?,
        carModel = json['carModel'] as String?,
        carImage = json['carImage'] as String?,
        userId = json['userId'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'carName': carName,
        'carNumber': carNumber,
        'carModel': carModel,
        'carImage': carImage,
        'userId': userId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}
