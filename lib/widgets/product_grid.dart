import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/admin_item.dart';
import 'package:flutter_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../providers/Product.dart';
import '../providers/Products.dart';


class ProductGrid extends StatelessWidget {
  final String page;
  const ProductGrid({required this.page,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    late List<Product> products;
    if(page == 'favorite'){
      products = Provider.of<Products>(context).favoriteItems;
    }else{
      products = Provider.of<Products>(context).items;
    }


    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 19 / 20,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ChangeNotifierProvider.value(
            value: products[index],
            child: page=="admin"? const AdminItem() : const ProductItem(),
          );
        });
  }
}
