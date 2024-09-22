// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:coffeeday/model/ColdCoffee.dart';
// import 'package:coffeeday/Controller/CoffeeController.dart';
// import 'package:coffeeday/ ElementUI/CoffeeCard.dart';
//
// class CoffeePage extends StatelessWidget {
//   final CoffeeController controller = Get.put(CoffeeController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Obx(() => Text(controller.isHotCoffee.value ? 'Hot Coffees' : 'Cold Coffees')),
//         actions: [
//           IconButton(
//             icon: Obx(() => Icon(controller.isHotCoffee.value ? Icons.ac_unit : Icons.local_fire_department)),
//             onPressed: controller.toggleCoffeeType,
//           ),
//         ],
//       ),
//       body: Obx(
//             () => AnimatedSwitcher(
//           duration: Duration(milliseconds: 500),
//           transitionBuilder: (Widget child, Animation<double> animation) {
//             return FadeTransition(
//               opacity: animation,
//               child: SlideTransition(
//                 position: Tween<Offset>(
//                   begin: Offset(0, 0.5),
//                   end: Offset.zero,
//                 ).animate(animation),
//                 child: child,
//               ),
//             );
//           },
//           child: PageView.builder(
//             key: ValueKey<bool>(controller.isHotCoffee.value),
//             itemCount: controller.currentCoffeeList.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: CoffeeCard(coffee: controller.currentCoffeeList[index]),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
