import 'package:flutter/material.dart';

class SearchEmployeePage extends StatelessWidget {
  const SearchEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80, color: Colors.green),
          SizedBox(height: 16),
          Text(
            'Tab de Búsqueda',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Aquí puedes buscar contenido'),
        ],
      ),
    );
  }
}
