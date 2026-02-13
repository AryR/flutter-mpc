import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class ServicePointSelectorDialog extends StatefulWidget {
  const ServicePointSelectorDialog({super.key});

  @override
  State<ServicePointSelectorDialog> createState() =>
      _ServicePointSelectorDialogState();
}

class _ServicePointSelectorDialogState
    extends State<ServicePointSelectorDialog> {
  _ServicePointSelectorDialogState();

  final List<ServicePoint> servicePoints = [
    ServicePoint(
      entity: 'Entity 1',
      center: 'Center 1',
      servicePoint: 'Service Point 1',
    ),
    ServicePoint(
      entity: 'Entity 2',
      center: 'Center 2',
      servicePoint: 'Service Point 2',
    ),
    ServicePoint(
      entity: 'Entity 3',
      center: 'Center 3',
      servicePoint: 'Service Point 3',
    ),
  ];

  ServicePoint? selectedItem;

  @override
  Widget build(BuildContext context) {
    selectedItem ??= servicePoints[0];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<ServicePoint>(
            value: selectedItem,
            isExpanded: true,
            hint: Text(selectedItem?.entity ?? 'Selecciona una entidad'),
            onChanged: (ServicePoint? item) {
              setState(() {
                selectedItem = item;
              });
            },
            items: servicePoints.map((ServicePoint servicePoint) {
              return DropdownMenuItem<ServicePoint>(
                value: servicePoint,
                child: Text(servicePoint.entity),
              );
            }).toList(),
          ),
          DropdownButton<ServicePoint>(
            value: selectedItem,
            isExpanded: true,
            hint: Text(selectedItem?.entity ?? 'Selecciona una entidad'),
            onChanged: (ServicePoint? item) {
              setState(() {
                selectedItem = item;
              });
            },
            items: servicePoints.map((ServicePoint servicePoint) {
              return DropdownMenuItem<ServicePoint>(
                value: servicePoint,
                child: Text(servicePoint.entity),
              );
            }).toList(),
          ),
          DropdownButton<ServicePoint>(
            value: selectedItem,
            isExpanded: true,
            hint: Text(selectedItem?.entity ?? 'Selecciona una entidad'),
            onChanged: (ServicePoint? item) {
              setState(() {
                selectedItem = item;
              });
            },
            items: servicePoints.map((ServicePoint servicePoint) {
              return DropdownMenuItem<ServicePoint>(
                value: servicePoint,
                child: Text(servicePoint.entity),
              );
            }).toList(),
          ),

          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }
}

class ServicePoint {
  final String entity;
  final String center;
  final String servicePoint;

  ServicePoint({
    required this.entity,
    required this.center,
    required this.servicePoint,
  });
}

@Preview(name: 'My Sample Text')
Widget mySampleText() {
  return MaterialApp(
    home: Scaffold(body: Center(child: ServicePointSelectorDialog())),
  );
}
