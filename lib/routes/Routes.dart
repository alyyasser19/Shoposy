import 'package:flutter_shop/screens/admin/add_product.dart';
import 'package:flutter_shop/screens/admin/admin.dart';
import 'package:flutter_shop/screens/admin/admin_overview.dart';
import 'package:flutter_shop/screens/admin/modify_product.dart';
import 'package:flutter_shop/screens/user/cart_screen.dart';
import 'package:flutter_shop/screens/Auth/login.dart';
import 'package:flutter_shop/screens/user/product_details.dart';
import 'package:flutter_shop/screens/user/products_overview.dart';
import 'package:flutter_shop/screens/Auth/sign_up.dart';

import '../screens/user/tabs.dart';

routes(ctx){
  return {
    //user Routes
    Tabs.routeName: (ctx) => const Tabs(),
    ProductsOverview.routeName: (ctx) => const ProductsOverview(),
    ProductDetails.routeName  : (ctx) => const ProductDetails(),
    Login.routeName: (ctx) => const Login(),
    SignUp.routeName: (ctx) => const SignUp(),
    CartScreen.routeName: (ctx) => const CartScreen(),
    //admin Routes
    Admin.routeName: (ctx) => const Admin(),
    AdminOverview.routeName: (ctx) => const AdminOverview(),
    AddProduct.routeName: (ctx) => const AddProduct(),
    ModifyProduct.routeName: (ctx) => const ModifyProduct(),
  };
}