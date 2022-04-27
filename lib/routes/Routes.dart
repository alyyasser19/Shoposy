import 'package:flutter_shop/screens/admin/admin.dart';
import 'package:flutter_shop/screens/cart_screen.dart';
import 'package:flutter_shop/screens/login.dart';
import 'package:flutter_shop/screens/product_details.dart';
import 'package:flutter_shop/screens/products_overview.dart';

import '../screens/tabs.dart';

routes(ctx){
  return {
    //user Routes
    Tabs.routeName: (ctx) => const Tabs(),
    ProductsOverview.routeName: (ctx) => const ProductsOverview(),
    ProductDetails.routeName  : (ctx) => const ProductDetails(),
    Login.routeName: (ctx) => const Login(),
    CartScreen.routeName: (ctx) => const CartScreen(),
    //admin Routes
    Admin.routeName: (ctx) => const Admin(),
  };
}