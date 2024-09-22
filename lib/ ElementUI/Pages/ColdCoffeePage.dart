import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/CoffeeController.dart';
import '../CoffeeFullScreenItem/CoffeeFullScreenItem.dart';


class ColdCoffeePage extends StatefulWidget {
  @override
  State<ColdCoffeePage> createState() => _ColdCoffeePageState();
}

class _ColdCoffeePageState extends State<ColdCoffeePage> with WidgetsBindingObserver {
  final CoffeeController controller = Get.put(CoffeeController());
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller.fetchColdCoffees();
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
      controller.fetchColdCoffees();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cold Coffees',style: TextStyle(color: Colors.white)),
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

