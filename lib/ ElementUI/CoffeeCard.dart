import 'package:coffeeday/model/HotCoffee.dart';
import 'package:flutter/material.dart';


class CoffeeCard extends StatelessWidget {
  final Hotcoffee coffee;

  const CoffeeCard({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              coffee.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  coffee.description,
                  style: const TextStyle(fontSize: 12),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  children: coffee.ingredients.map((ingredient) => Chip(
                    label: Text(ingredient, style: const TextStyle(fontSize: 10)),
                    padding: const EdgeInsets.all(4),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}