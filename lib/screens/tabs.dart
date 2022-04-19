import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/products_overview.dart';
import 'package:flutter_shop/theme/Colors.dart';

import 'favorite.dart';

class Tabs extends StatefulWidget {
  static const routeName = '/';
  const Tabs({Key?key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  final List<Map<String,Object>>_pages=[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages.add({
      'page': const ProductsOverview(),
      'title': 'Home',
    });
    _pages.add({
      'page': Container(
        child: const Center(
          child: Text('Categories'),
        ),
      ),
      'title': 'About',
    });
    _pages.add({
      'page': const Favorite(),
      'title': 'Profile',
    });
    _pages.add({
      'page': Container(
        child: const Center(
          child: Text('Cart'),
        ),
      ),
      'title': 'Cart',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps_sharp),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
