import 'package:flutter/material.dart';

import '../providers/Product.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/product-details';
  const ProductDetails({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product? product = ModalRoute.of(context)?.settings.arguments as Product?;
    String title = product?.title ?? 'Products';
    String description = product?.description ?? 'Products';
    double price = product?.price ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('Product Details'),
      ),
    );
  }
}
