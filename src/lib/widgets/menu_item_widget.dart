import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            Icon(item.icon, size: 80, color: Theme.of(context).primaryColor),
            Text(
              item.title,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String title;

  MenuItem({required this.icon, required this.title});
}
