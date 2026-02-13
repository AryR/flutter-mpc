import 'package:flutter/material.dart';
import 'package:flutter_mpc/widgets/service_point_selector_dialog.dart';

class ServicePointSelectorWidget extends StatelessWidget {
  const ServicePointSelectorWidget({super.key, required this.servicePoint});

  final ServicePoint servicePoint;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            builder: (BuildContext context) {
              return Wrap(children: [ServicePointSelectorDialog()]);
            },
          );
        },
        child: Row(
          spacing: 10,
          children: [
            Text(
              servicePoint.servicePoint,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
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
