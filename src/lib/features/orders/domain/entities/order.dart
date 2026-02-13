import 'package:flutter_mpc/features/orders/domain/entities/order_status.dart';
import 'package:flutter_mpc/features/orders/domain/entities/order_type.dart';

class Order {
  final bool hasDate;
  final bool hasLimitDate;
  final bool isNonPerforming;
  final String origin;
  final DateTime requestedTime;
  final String serviceCode;
  final String serviceId;
  final OrderStatus serviceStatusCode;
  final String serviceStatusDescription;
  final OrderType serviceType;
  final DateTime? requestFinalTime;
  final DateTime? requestInitialTime;

  Order({
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
    this.requestFinalTime,
    this.requestInitialTime,
  });
}
