import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/admin/add_product.dart';
import 'package:flutter_shop/screens/admin/admin_overview.dart';
import 'package:flutter_shop/screens/products_overview.dart';



class Admin extends StatefulWidget {
  static const routeName = '/admin';
  const Admin({Key?key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
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
      'page': const AdminOverview(),
      'title': 'Home',
    });
    _pages.add({
      'page': const Center(
        child: Text('Categories'),
      ),
      'title': 'Categories',
    });
    _pages.add({
      'page': const Center(
        child: Text('Users'),
      ),
      'title': 'Users',
    });
    _pages.add({
      'page': const AddProduct(),
      'title': 'Add',
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items:  const <BottomNavigationBarItem>[
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
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.add),
            label: 'Add',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
