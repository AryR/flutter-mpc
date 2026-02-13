import '../entities/order.dart';

abstract class OrdersServices {
  Future<List<Order>?> fetchOrders();
}
