import 'package:coffeeday/model/HotCoffee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeFullScreenItem extends StatelessWidget {
  final Hotcoffee coffee;

  const CoffeeFullScreenItem({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          coffee.image,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                coffee.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                coffee.description,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: coffee.ingredients.map((ingredient) => Chip(
                  label: Text(ingredient),
                  backgroundColor: Colors.white.withOpacity(0.7),
                )).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}