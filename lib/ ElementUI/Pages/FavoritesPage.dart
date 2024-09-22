import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favorites = [
    {'name': 'Espresso', 'image': 'assets/espresso.jpg'},
    {'name': 'Cappuccino', 'image': 'assets/cappuccino.jpg'},
    {'name': 'Latte', 'image': 'assets/latte.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final favorite = favorites[index];
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    favorite['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(favorite['name']),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
