import 'package:flutter_shop/screens/product_details.dart';
import 'package:flutter_shop/screens/products_overview.dart';

import '../screens/tabs.dart';

routes(ctx){
  return {
    Tabs.routeName: (ctx) => const Tabs(),
    ProductsOverview.routeName: (ctx) => const ProductsOverview(),
    ProductDetails.routeName  : (ctx) => const ProductDetails(),
  };
}