import 'package:flutter/material.dart';
import 'package:flutter_mpc/features/cashtoday/presentation/cashtoday_page.dart';
import 'package:flutter_mpc/features/orders/presentation/orders_page.dart';
import 'package:flutter_mpc/features/search_employee/presentation/search_employee_page.dart';

import 'home_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class TabItem {
  final int index;
  final IconData icon;
  final String title;
  final Widget page;

  TabItem({
    required this.index,
    required this.icon,
    required this.title,
    required this.page,
  });
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: iconList.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  final iconList = <TabItem>{
    TabItem(index: 0, icon: Icons.home, title: "Home", page: HomePage()),
    TabItem(
      index: 1,
      icon: Icons.search,
      title: "Search Employee",
      page: SearchEmployeePage(),
    ),
    TabItem(index: 2, icon: Icons.person, title: "Orders", page: OrdersPage()),
    TabItem(
      index: 3,
      icon: Icons.money,
      title: "Cash Today",
      page: CashTodayPage(),
    ),
  }.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...iconList
                .map((item) {
                  int index = item.index;
                  bool isSelected = _tabController.index == index;
                  var color = isSelected
                      ? Theme.of(
                          context,
                        ).bottomNavigationBarTheme.selectedItemColor
                      : Theme.of(
                          context,
                        ).bottomNavigationBarTheme.unselectedItemColor;

                  return [
                    GestureDetector(
                      onTap: () => _onItemTapped(index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(item.icon, color: color),
                          Text(
                            item.title,
                            style: TextStyle(fontSize: 10, color: color),
                          ),
                        ],
                      ),
                    ),
                  ];
                })
                .expand((element) => element),
          ],
        ),
      ),
      body: Center(child: iconList[_tabController.index].page),
    );
  }
}
