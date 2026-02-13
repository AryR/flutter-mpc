import 'package:collection/collection.dart';
import 'package:flutter_mpc/features/orders/domain/entities/order_status.dart';
import 'package:flutter_mpc/features/orders/domain/repositories/orders_services.dart';

import '../entities/order.dart';

class GetGroupedOrdersUseCase {
  final OrdersServices repository;

  GetGroupedOrdersUseCase(this.repository);

  Future<List<MapEntry<String, List<Order>>>> execute() async {
    var orders = await repository.fetchOrders();

    if (orders == null) {
      return [];
    }

    var groupedItemMap = groupBy(orders, (order) {
      DateTime orderDate = DateTime(
        order.requestedTime.year,
        order.requestedTime.month,
        order.requestedTime.day,
      );

      DateTime today = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

      if (order.serviceStatusCode == OrderStatus.cancelled) {
        return "Cancelados";
      } else if (orderDate.compareTo(today) > 0) {
        return "Futuras";
      } else if (orderDate.compareTo(today) == 0) {
        return "Hoy";
      } else {
        return "Pasadas";
      }
    });

    // Ordenar los grupos en un orden específico
    final groupOrder = ["Hoy", "Futuras", "Pasadas", "Cancelados"];
    final sortedEntries = groupedItemMap.entries.toList()
      ..sort((a, b) {
        int indexA = groupOrder.indexOf(a.key);
        int indexB = groupOrder.indexOf(b.key);
        return indexA.compareTo(indexB);
      });

    return sortedEntries;
  }
}
