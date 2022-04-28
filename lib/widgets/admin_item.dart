import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Product.dart';
import '../providers/Products.dart';
import '../theme/Colors.dart';

class AdminItem extends StatelessWidget {
  const AdminItem({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final product = Provider.of<Product>(context);
    final String title= product.title;
    final String imageUrl= product.imageUrl;
    final double price= product.price;

    return Stack(
      children : [Material(
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
                      SizedBox(child: Text(title,style: Theme.of(context).textTheme.headline6), width: 110,),
                      Text('$price EGP',style: Theme.of(context).textTheme.subtitle1)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
        Positioned(
          right: 0,
          bottom: 0,
          child: IconButton(icon: Image.asset('assets/images/edit_Icon.png'), iconSize: 46, padding: const EdgeInsets.all(0),splashColor: Colors.transparent , onPressed: (){
            Navigator.of(context).pushNamed('/admin/edit',arguments: product);
          },),
        ),
        // favorite button
        Positioned(
          right: 10,
          top: 4,
          child: IconButton(
            icon: const Icon(Icons.delete,color: shopsyRd,size: 40),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you want to remove this item from the store?',style: TextStyle(fontSize: 18),),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                      ),
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                      ),
                    ],
                  )).then((value)  {
                if (value) {
                  products.deleteProduct(product.id); }
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          )
        ),
      ],
    );
  }
}
