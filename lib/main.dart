import 'package:coffeeday/AppDrawer/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import ' ElementUI/Pages/HotCoffeePage.dart';
import ' ElementUI/Pages/SplashScreen.dart';
import 'Controller/CoffeeController.dart';

void main() {
  Get.put(CoffeeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
theme: AppTheme.brownTheme,
      // theme: ThemeData(
      //   primarySwatch: Colors.brown,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      //     appBarTheme: const AppBarTheme(
      //       titleTextStyle: TextStyle(
      //           color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      //     backgroundColor: Colors.brown,
      //       iconTheme:IconThemeData(color: Colors.white,
      //           size: 30.0
      //       ),
      // )
      // ),

      home: SplashScreen(),
    );
  }
}


