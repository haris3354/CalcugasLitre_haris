class CalculateFuelModel {
  final int? status;
  final int? count;
  final int? totalPrice;
  final int? totalQuntity;
  final String? message;
  final List<Fuel>? fuel;

  CalculateFuelModel({
    this.status,
    this.count,
    this.totalPrice,
    this.totalQuntity,
    this.message,
    this.fuel,
  });

  CalculateFuelModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        count = json['count'] as int?,
        totalPrice = json['totalPrice'] as int?,
        totalQuntity = json['totalQuntity'] as int?,
        message = json['message'] as String?,
        fuel = (json['fuel'] as List?)
            ?.map((dynamic e) => Fuel.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'count': count,
        'totalPrice': totalPrice,
        'totalQuntity': totalQuntity,
        'message': message,
        'fuel': fuel?.map((e) => e.toJson()).toList()
      };
}

class Fuel {
  final String? id;
  final String? userId;
  final int? fuelPrice;
  final int? fuelQuantity;
  final String? carId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Fuel({
    this.id,
    this.userId,
    this.fuelPrice,
    this.fuelQuantity,
    this.carId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Fuel.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        userId = json['userId'] as String?,
        fuelPrice = json['fuelPrice'] as int?,
        fuelQuantity = json['fuelQuantity'] as int?,
        carId = json['carId'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'fuelPrice': fuelPrice,
        'fuelQuantity': fuelQuantity,
        'carId': carId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class History {
  final String? id;
  final String? fromdate;
  final String? todate;
  final int? totalPrice;
  final int? totalQty;
  final String? userId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  History({
    this.id,
    this.fromdate,
    this.todate,
    this.totalPrice,
    this.totalQty,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  History.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      fromdate = json['fromdate'] as String?,
      todate = json['todate'] as String?,
      totalPrice = json['totalPrice'] as int?,
      totalQty = json['totalQty'] as int?,
      userId = json['userId'] as String?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'fromdate' : fromdate,
    'todate' : todate,
    'totalPrice' : totalPrice,
    'totalQty' : totalQty,
    'userId' : userId,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}