import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/user/cart_screen.dart';
import 'package:flutter_shop/screens/user/products_overview.dart';
import 'package:flutter_shop/theme/Colors.dart';
import 'package:provider/provider.dart';

import '../../providers/Cart.dart';
import 'favorite.dart';

class Tabs extends StatefulWidget {
  static const routeName = '/home';
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
      'page': const Center(
        child: Text('Categories'),
      ),
      'title': 'About',
    });
    _pages.add({
      'page': const Favorite(),
      'title': 'Profile',
    });
    _pages.add({
      'page': const CartScreen(),
      'title': 'Cart',
    });
  }

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    int itemCount = cart.itemCount;
    return Scaffold(
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.apps_sharp),
            label: 'Categories',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: itemCount > 0 ? Badge(child: const Icon(Icons.shopping_cart)
            ,badgeColor: shopsyRd,
            animationType: BadgeAnimationType.scale,
            badgeContent:  Text( itemCount.toString() ,style: const TextStyle(color: Colors.white),),
            ) : const Icon(Icons.shopping_cart),
            label: 'Cart',
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
