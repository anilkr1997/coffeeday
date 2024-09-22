import 'package:coffeeday/AppDrawer/AnimatedDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ ElementUI/Pages/FavoritesPage.dart';
import '../ ElementUI/Pages/OrderHistoryPage.dart';
import '../ ElementUI/Pages/ProfilePage.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedDrawer(
      child:  Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'Coffee Days',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Get.back();
                Get.to(() => ProfilePage(), transition: Transition.rightToLeftWithFade);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Order History'),
              onTap: () {
                Get.back();
                Get.to(() => OrderHistoryPage(), transition: Transition.rightToLeftWithFade);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                Get.back();
                Get.to(() => FavoritesPage(), transition: Transition.rightToLeftWithFade);
              },
            ),
          ],
        ),
      ),
    ) ;

  }
}
