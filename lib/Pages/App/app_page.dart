import 'package:flutter/material.dart';
import 'package:laza/Pages/Home/hom_page.dart';

import '../../Core/Constant/colors_app.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          width: MediaQuery.of(context).size.width / 1.1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
      ),
      body: pages[isSelected],
      bottomNavigationBar: NavigationBar(
        indicatorColor: ColorsApp.purple,
        indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(width: 0, color: Colors.black38)),
        selectedIndex: isSelected,
        onDestinationSelected: (value) {
          setState(() {
            isSelected = value;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
              icon: Icon(
                Icons.home,
              ),
              selectedIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'HOME'),
          NavigationDestination(
              icon: Icon(Icons.favorite),
              selectedIcon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: 'WISHLIST'),
          NavigationDestination(
              icon: Icon(Icons.shopify),
              selectedIcon: Icon(
                Icons.shopify,
                color: Colors.white,
              ),
              label: 'SHOPPING'),
          NavigationDestination(
              icon: Icon(Icons.view_cozy),
              selectedIcon: Icon(
                Icons.view_cozy,
                color: Colors.white,
              ),
              label: 'VIZACARD'),
        ],
      ),
    );
  }
}

List<Widget> pages = [
  const HomPage(),
  const FavoritePage(),
  const Center(
    child: Text('3'),
  ),
  const Center(
    child: Text('4'),
  ),
];

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  double changeValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text('0.0'),
              Expanded(
                child: Slider(
                  value: changeValue,
                  min: 0,
                  max: 10,
                  onChanged: (value) {
                    setState(() {
                      changeValue = value;
                    });
                  },
                ),
              ),
              Text('${changeValue.floorToDouble()}'),
            ],
          ),
        ),
      ),
    );
  }
}
