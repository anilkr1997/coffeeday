import 'package:flutter/material.dart';

class AnimatedDrawer extends StatelessWidget {
  final Widget child;

  const AnimatedDrawer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      builder: (_, double value, __) {
        return Transform(
          transform: Matrix4.translationValues(value * 250, 0, 0),
          child: child,
        );
      },
    );
  }
}
