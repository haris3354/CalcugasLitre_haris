class HistoryModel {
  final int? status;
  final String? message;
  final List<History>? history;

  HistoryModel({
    this.status,
    this.message,
    this.history,
  });

  HistoryModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?,
      history = (json['history'] as List?)?.map((dynamic e) => History.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'history' : history?.map((e) => e.toJson()).toList()
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