import 'package:flutter/material.dart';

enum OrderStatus {
  preparing,
  prepared,
  pending,
  received,
  onway,
  done,
  planned,
  cancelled,
}

extension OrderStatusExtension on OrderStatus {
  Color get color {
    switch (this) {
      case OrderStatus.preparing:
        return Color(0xFF65b1b1);
      case OrderStatus.prepared:
        return Color(0xFF2e84aa);
      case OrderStatus.pending:
        return Color(0xFFEE8640);
      case OrderStatus.received:
        return Color(0xFF48A0E2);
      case OrderStatus.onway:
        return Color(0xFF4148C4);
      case OrderStatus.done:
        return Color(0xFF55AE58);
      case OrderStatus.cancelled:
        return Color(0xFF780B0B);
      case OrderStatus.planned:
        return Color(0xFFF6CB47);
    }
  }
}
