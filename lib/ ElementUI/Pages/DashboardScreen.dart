import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:coffeeday/AppDrawer/AppDrawer.dart';
import 'ColdCoffeePage.dart';
import 'FavoritesPage.dart';
import 'HotCoffeePage.dart';
import 'OrderHistoryPage.dart';
import 'ProfilePage.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _bannerController = PageController();
  int _currentBanner = 0;
  int _cartItemCount = 0;
  String _lastAddedItem = '';
  final List<String> _bannerImages = [
    'https://img.freepik.com/premium-photo/coffee-cup-with-red-straw-straw-middle_1304829-5192.jpg',
    'https://img.freepik.com/premium-photo/beautiful-cold-drink-cola-with-ice-cubes-ar-c_1272857-5323.jpg',
    'https://img.freepik.com/premium-photo/foods-grilled-burger_1121151-16075.jpg',
    'https://img.freepik.com/premium-photo/refreshing-ice-cold-drinks-ready-be-served_1272857-5653.jpg',
    'https://img.freepik.com/premium-photo/fresh-cola-drink-with-green-lime_1272857-4628.jpg',
  ];
  final List<String> _Imagesbag = [
    'https://img.freepik.com/free-photo/hot-coffee-steams-wooden-table-refreshing-addiction-generated-by-artificial-intelligence_188544-150752.jpg',
    'https://cdn.dotpe.in/longtail/store-items/1332303/IX4B7CFe.jpeg',
    'https://as2.ftcdn.net/v2/jpg/03/01/97/85/1000_F_301978579_CF2bQaIlrM4BxoX3mXkmEuEnVeI4GnaJ.jpg',
    'https://img.freepik.com/premium-photo/refreshing-ice-cold-drinks-ready-be-served_1272857-5653.jpg',
    'https://img.freepik.com/premium-photo/fresh-cola-drink-with-green-lime_1272857-4628.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _autoScrollBanner();
  }

  void _autoScrollBanner() {
    Future.delayed(const Duration(seconds: 5), () {
      if (_currentBanner < _bannerImages.length - 1) {
        _currentBanner++;
      } else {
        _currentBanner = 0;
      }
      if (_bannerController.hasClients) {
        _bannerController.animateToPage(
          _currentBanner,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
      _autoScrollBanner();
    });
  }
  void _addToCart(String itemName) {
    setState(() {
      _cartItemCount++;
      _lastAddedItem = itemName;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title: const Text('Coffee Day'),
        actions: [
          _buildCartAction()
        ],

      ),
      bottomNavigationBar: _buildBottomBar(),
      body: ListView(
        children: [
          Card(
            shadowColor: Colors.white12,
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _bannerController,
                itemCount: _bannerImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentBanner = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.network(
                    _bannerImages[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildCategorySection(
            context,
            categoryName: 'Hot Coffees',
            items: [
              CoffeeItem(name: 'Espresso', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrjyHlkViXf1t9FlpAnmlozT9DZSvPbFi-Lg&s', price: '\$2.50'),
              CoffeeItem(name: 'Latte', image: 'https://5.imimg.com/data5/GN/RG/GLADMIN-10207619/latte.png', price: '\$3.50'),
              CoffeeItem(name: 'Cappuccino', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPVnUgGP6ADE_fnololFjuynqQOuCrCdwS1w&s', price: '\$3.00'),
            ],
            onSeeAllPressed: () => Get.to(() => HotCoffeePage(), transition: Transition.downToUp, duration: const Duration(seconds: 2)),
          ),
          _buildCategorySection(
            context,
            categoryName: 'Cold Coffees',
            items: [
              CoffeeItem(name: 'Iced Latte', image: 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/iced-latte-30188f7.jpg', price: '\$3.75'),
              CoffeeItem(name: 'Frappuccino', image: 'https://www.lavazza.co.uk/content/dam/lavazza-athena/b2c/stories/article/coffee-secrets/how-to-make-frappuccino-home/hero/m-Frappuccino.jpg', price: '\$4.50'),
              CoffeeItem(name: 'Cold Brew', image: 'https://www.acouplecooks.com/wp-content/uploads/2021/08/French-Press-Cold-Brew-011.jpg', price: '\$3.25'),
            ],
            onSeeAllPressed: () => Get.to(() => ColdCoffeePage(), transition: Transition.leftToRightWithFade, duration: const Duration(seconds: 2)),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Quick Access',

            ),
          ),
          const SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildMenuItem('Hot Coffee', FontAwesomeIcons.mugHot, () {
                Get.to(() => HotCoffeePage(), transition: Transition.downToUp, duration: const Duration(seconds: 2));
              }, _Imagesbag[0]),
              _buildMenuItem('Cold Coffee', FontAwesomeIcons.mugSaucer, () {
                Get.to(() => ColdCoffeePage(), transition: Transition.leftToRightWithFade, duration: const Duration(seconds: 2));
              }, _Imagesbag[1]),
              _buildMenuItem('Desserts', FontAwesomeIcons.cakeCandles, () {
                // Navigate to desserts page
              }, _Imagesbag[2]),
              _buildMenuItem('Locations', Icons.location_on, () {
                // Navigate to locations page
              }, _Imagesbag[3]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, {required String categoryName, required List<CoffeeItem> items, required VoidCallback onSeeAllPressed}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,

              ),
              TextButton(
                onPressed: onSeeAllPressed,
                child: const Text('See All', style: TextStyle(color: Colors.brown)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 235,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                child: _buildCoffeeItem(context, items[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCoffeeItem(BuildContext context, CoffeeItem item) {
    return SizedBox(
      width: 160,

      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                item.image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,

                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        item.price,
                        style: TextStyle(color: Colors.brown[700], fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 35,),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.brown,size: 30,),
                        onPressed: () => _addToCart(item.name),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildCartAction() {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            // Navigate to cart page
          },
        ),
        if (_cartItemCount > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$_cartItemCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget? _buildBottomBar() {
    if (_cartItemCount > 0) {
      return BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last added: $_lastAddedItem',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Items in cart: $_cartItemCount',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }
    return null;
  }
  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap, String image) {
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.brown.withOpacity(0.8),
                BlendMode.darken,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Colors.white),
              const SizedBox(height: 8),
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
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
            leading: const Icon(Icons.person, color: Colors.brown,),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => ProfilePage(), transition: Transition.rightToLeftWithFade, duration: const Duration(seconds: 1));
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.mugHot, color: Colors.brown),
            title: const Text('Hot Coffee'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => HotCoffeePage(), transition: Transition.rightToLeftWithFade, duration: const Duration(seconds: 1));
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.mugSaucer, color: Colors.brown),
            title: const Text('Cold Coffee'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => ColdCoffeePage(), transition: Transition.rightToLeftWithFade, duration: const Duration(seconds: 1));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.brown),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => FavoritesPage(), transition: Transition.rightToLeftWithFade, duration: const Duration(seconds: 1));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.brown),
            title: const Text('Order History'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => OrderHistoryPage(), transition: Transition.rightToLeftWithFade, duration: const Duration(seconds: 2));
            },
          ),
        ],
      ),
    );
  }
}

class CoffeeItem {
  final String name;
  final String image;
  final String price;

  CoffeeItem({required this.name, required this.image, required this.price});
}
