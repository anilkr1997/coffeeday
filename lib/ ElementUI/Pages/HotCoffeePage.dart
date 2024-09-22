import 'package:coffeeday/%20ElementUI/Pages/ColdCoffeePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../CoffeePageRoute/CoffeePageRoute.dart';
import '../../Controller/CoffeeController.dart';
import '../CoffeeCard.dart';
import '../CoffeeFullScreenItem/CoffeeFullScreenItem.dart';


class HotCoffeePage extends StatefulWidget {
  @override
  State<HotCoffeePage> createState() => _HotCoffeePageState();
}

class _HotCoffeePageState extends State<HotCoffeePage> with WidgetsBindingObserver {
  final CoffeeController controller = Get.put(CoffeeController());
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller.fetchHotCoffees();
    _pageController = PageController(initialPage: _currentPage);
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller.fetchHotCoffees();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Hot Coffees', style: TextStyle(color: Colors.white)),
        // actions: [
        //   IconButton(
        //     icon: const Icon(FontAwesomeIcons.mugHot, color: Colors.white),
        //     onPressed: () {
        //       Navigator.of(context).push(CoffeePageRoute(page: ColdCoffeePage()));
        //     },
        //   ),
        // ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return PageView.builder(
            controller: _pageController,
            itemCount: controller.hotCoffees.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final coffee = controller.hotCoffees[index];
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: CoffeeFullScreenItem(
                  key: ValueKey<int>(index),
                  coffee: coffee,
                ),
              );
            },
          );
        }
      }),

    );
  }
}
