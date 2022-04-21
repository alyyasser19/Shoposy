import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/Product.dart';
import 'package:flutter_shop/screens/product_details.dart';
import 'package:flutter_shop/theme/Colors.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart';
import '../providers/Products.dart';

class ProductItem extends StatelessWidget {

  const ProductItem({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Products products =Provider.of<Products>(context);
    final Cart cart= Provider.of<Cart>(context);
    final product = Provider.of<Product>(context);
    final String title= product.title;
    final String id= product.id;
    final String imageUrl= product.imageUrl;
    final double price= product.price;
    final bool isFavorite= product.isFavorite;

    return Stack(
      children : [GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routeName, arguments: product);
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(40),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: offWhite,
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    child: Image.network(imageUrl, height: 40, width: double.infinity, fit: BoxFit.contain,),
                  height: 120,
                ),
                Container(
                  padding: const EdgeInsets.only(left:10,bottom: 10),
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(child: Text(title,style: Theme.of(context).textTheme.headline6), width: 120,),
                      Text('$price EGP',style: Theme.of(context).textTheme.subtitle1)
                    ],
                  ),
                )
              ],
        ),
            ),
          ),
        ),
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: IconButton(icon: Image.asset('assets/images/add_to_cart.png'), iconSize: 46, padding: const EdgeInsets.all(0),splashColor: Colors.transparent , onPressed: (){
          cart.addItem(id, price, title, imageUrl);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added item to cart'),duration: Duration(seconds: 2),elevation: 4));
        },),
      ),
        // favorite button
        Positioned(
          left: 4,
          top: 5,
          child: isFavorite? IconButton(
            icon: const Icon(Icons.favorite,color: shopsyRd),
            onPressed: () {
              product.setFavorite();
              products.updateFavorites();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ): IconButton(
            icon: const Icon(Icons.favorite_border,color: shopsyRd),
            onPressed: () {
                  product.setFavorite();
                  products.updateFavorites();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
