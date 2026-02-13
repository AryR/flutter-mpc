import 'package:flutter_mpc/features/orders/data/models/base/sol_customer_response_base.dart';

class OrderResponse extends SolCustomerResponseBase {
  OrderResponse({
    required super.success,
    required super.errors,
    required this.orders,
  });

  final List<OrderModel> orders;

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    var base = SolCustomerResponseBase.fromJson(json);
    return OrderResponse(
      success: base.success,
      errors: base.errors,
      orders: (json['requestHistorials']['services'] as List)
          .map((serviceJson) => OrderModel.fromJson(serviceJson))
          .toList(),
    );
  }
}

class OrderModel {
  final bool hasDate;
  final bool hasLimitDate;
  final bool isNonPerforming;
  final String origin;
  final DateTime requestedTime;
  final String serviceCode;
  final String serviceId;
  final String serviceStatusCode;
  final String serviceStatusDescription;
  final int serviceType;
  final bool? isChange;
  final DateTime? requestFinalTime;
  final DateTime? requestInitialTime;

  OrderModel({
    required this.hasDate,
    required this.hasLimitDate,
    required this.isNonPerforming,
    required this.origin,
    required this.requestedTime,
    required this.serviceCode,
    required this.serviceId,
    required this.serviceStatusCode,
    required this.serviceStatusDescription,
    required this.serviceType,
    this.isChange,
    this.requestFinalTime,
    this.requestInitialTime,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      hasDate: json['hasDate'] ?? false,
      hasLimitDate: json['hasLimitDate'] ?? false,
      isNonPerforming: json['isNonPerforming'] ?? false,
      origin: json['origin'] ?? '',
      requestedTime: DateTime.parse(json['requestedTime']),
      serviceCode: json['serviceCode'] ?? '',
      serviceId: json['serviceId'] ?? '',
      serviceStatusCode: json['serviceStatusCode'] ?? '',
      serviceStatusDescription: json['serviceStatusDescription'] ?? '',
      serviceType: json['serviceType'] ?? 0,
      isChange: json['isChange'],
      requestFinalTime: json['requestFinalTime'] == null
          ? null
          : DateTime.parse(json['requestFinalTime']),
      requestInitialTime: json['requestInitialTime'] == null
          ? null
          : DateTime.parse(json['requestInitialTime']),
    );
  }
}
