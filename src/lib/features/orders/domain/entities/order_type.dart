import 'package:flutter/material.dart';

enum OrderType {
  pickup,
  delivery,
  deliveryChange,
  transit,
  supply,
  technicalAssistance,
}

extension OrderTypeExtension on OrderType {
  String get displayName {
    switch (this) {
      case OrderType.pickup:
        return 'Recolección';
      case OrderType.delivery:
        return 'Entrega';
      case OrderType.deliveryChange:
        return 'Entrega con Cambio';
      case OrderType.supply:
        return 'Suministro';
      case OrderType.technicalAssistance:
        return 'Asistencia Técnica';
      case OrderType.transit:
        return 'Tránsito';
    }
  }

  IconData get icon {
    switch (this) {
      case OrderType.pickup:
        return Icons.local_shipping;
      case OrderType.delivery:
        return Icons.attach_money;
      case OrderType.deliveryChange:
        return Icons.currency_exchange;
      case OrderType.supply:
        return Icons.inventory;
      case OrderType.technicalAssistance:
        return Icons.build;
      case OrderType.transit:
        return Icons.directions_transit;
    }
  }
}
