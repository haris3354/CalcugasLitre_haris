class FuelsResponseModel {
  final int? status;
  final String? message;
  final List<Car>? car;

  FuelsResponseModel({
    this.status,
    this.message,
    this.car,
  });

  FuelsResponseModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        car = (json['car'] as List?)
            ?.map((dynamic e) => Car.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'car': car?.map((e) => e.toJson()).toList()
      };
}

class Car {
  final String? id;
  final int? fuelPrice;
  final int? fuelQuantity;
  final String? carId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Car({
    this.id,
    this.fuelPrice,
    this.fuelQuantity,
    this.carId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Car.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        fuelPrice = json['fuelPrice'] as int?,
        fuelQuantity = json['fuelQuantity'] as int?,
        carId = json['carId'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'fuelPrice': fuelPrice,
        'fuelQuantity': fuelQuantity,
        'carId': carId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}
