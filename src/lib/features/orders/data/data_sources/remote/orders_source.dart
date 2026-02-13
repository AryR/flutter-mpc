import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/order.dart';

class OrdersSource {
  static const String baseUrl = 'http://10.0.2.2:3000';

  static Future<List<OrderModel>?> fetchOrders() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/orders'));

      if (response.statusCode == 200) {
        final OrderResponse orderResponse = OrderResponse.fromJson(
          json.decode(response.body),
        );
        if (orderResponse.success) {
          return orderResponse.orders;
        } else {
          throw Exception(
            orderResponse.errors.map((e) => e.message).join(', '),
          );
        }
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
