class StatsModel {
  final int? status;
  final String? message;
  final List<Fuel>? fuel;

  StatsModel({
    this.status,
    this.message,
    this.fuel,
  });

  StatsModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        fuel = (json['fuel'] as List?)
            ?.map((dynamic e) => Fuel.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'fuel': fuel?.map((e) => e.toJson()).toList()
      };
}

class Fuel {
  final String? month;
  final int? sum;

  Fuel({
    this.month,
    this.sum,
  });

  Fuel.fromJson(Map<String, dynamic> json)
      : month = json['month'] as String?,
        sum = json['sum'] as int?;

  Map<String, dynamic> toJson() => {'month': month, 'sum': sum};
}
