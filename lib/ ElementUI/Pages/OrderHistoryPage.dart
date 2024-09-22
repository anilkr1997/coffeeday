import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {'id': '001', 'date': '2023-05-20', 'total': '\$15.99'},
    {'id': '002', 'date': '2023-05-18', 'total': '\$12.50'},
    {'id': '003', 'date': '2023-05-15', 'total': '\$18.75'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text('Order #${order['id']}'),
            subtitle: Text('Date: ${order['date']}'),
            trailing: Text(order['total']),
            onTap: () {
              // Implement order details view
            },
          );
        },
      ),
    );
  }
}
