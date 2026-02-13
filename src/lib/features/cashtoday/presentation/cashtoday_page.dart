import 'package:flutter/material.dart';
import 'package:flutter_mpc/widgets/service_point_selector_widget.dart';

import '../../../widgets/menu_item_widget.dart';

class CashTodayPage extends StatelessWidget {
  CashTodayPage({super.key});

  final iconList = <MenuItem>{
    MenuItem(icon: Icons.local_atm, title: "Nuevo depósito"),
    MenuItem(icon: Icons.account_balance, title: "Transacciones"),
    MenuItem(icon: Icons.bar_chart, title: "Posicion Financiera"),
    MenuItem(icon: Icons.troubleshoot, title: "Issues"),
    MenuItem(icon: Icons.contact_support, title: "Faqs"),
  }.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ServicePointSelectorWidget(
          servicePoint: ServicePoint(
            entity: "entity",
            center: "center",
            servicePoint: "servicePoint",
          ),
        ),
      ),
      body: Center(
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          itemCount: iconList.length,
          itemBuilder: (ctx, i) {
            return InkWell(
              onTap: () {
                // Handle menu item tap
              },
              child: MenuItemWidget(item: iconList[i]),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 5,
          ),
        ),
      ),
    );
  }
}
