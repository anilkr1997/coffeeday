import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LoginScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => LoginScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius:BorderRadius.circular(100),
                child: Image.asset('assets/logonn.png', width: 150, height: 150),

              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Coffee Days',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown[800]),
            ),
          ],
        ),
      ),
    );
  }
}