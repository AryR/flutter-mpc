import 'package:flutter_mpc/features/orders/data/data_sources/remote/orders_source.dart';
import 'package:flutter_mpc/features/orders/domain/entities/order.dart';
import 'package:flutter_mpc/features/orders/domain/entities/order_status.dart';
import 'package:flutter_mpc/features/orders/domain/entities/order_type.dart';
import '../../domain/repositories/orders_services.dart';

class OrdersServicesImpl extends OrdersServices {
  @override
  Future<List<Order>?> fetchOrders() async {
    try {
      final orders = await OrdersSource.fetchOrders();

      if (orders != null) {
        return orders
            .map(
              (order) => Order(
                hasDate: order.hasDate,
                hasLimitDate: order.hasLimitDate,
                isNonPerforming: order.isNonPerforming,
                origin: order.origin,
                requestedTime: order.requestedTime,
                serviceCode: order.serviceCode,
                serviceId: order.serviceId,
                serviceStatusCode: getOrderStatus(order.serviceStatusCode),
                serviceStatusDescription: order.serviceStatusDescription,
                serviceType: getOrderType(
                  order.serviceType,
                  order.isChange ?? false,
                ),
                requestFinalTime: order.requestFinalTime,
                requestInitialTime: order.requestInitialTime,
              ),
            )
            .toList();
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  OrderType getOrderType(int serviceType, bool isChange) {
    switch (serviceType) {
      case 0:
        return OrderType.pickup;
      case 1:
        return isChange ? OrderType.deliveryChange : OrderType.delivery;
      case 2:
        return OrderType.transit;
      case 3:
        return OrderType.technicalAssistance;
      case 4:
        return OrderType.supply;
      default:
        return OrderType.delivery;
    }
  }

  OrderStatus getOrderStatus(String statusCode) {
    switch (statusCode.toUpperCase()) {
      case "PREPARING":
        return OrderStatus.preparing;
      case "PREPARED":
        return OrderStatus.prepared;
      case "PENDING":
        return OrderStatus.pending;
      case "RECEIVED":
        return OrderStatus.received;
      case "ONWAY":
        return OrderStatus.onway;
      case "DONE":
        return OrderStatus.done;
      case "CANCELLED":
        return OrderStatus.cancelled;
      case "PLANNED":
        return OrderStatus.planned;
      default:
        return OrderStatus.pending;
    }
  }
}
