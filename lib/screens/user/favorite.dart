import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/product_grid.dart';


class Favorite extends StatelessWidget {
  static const String routeName = '/favorite';
  const Favorite({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProductGrid(page: 'favorite');
  }
}
