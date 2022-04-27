import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart';
import '../providers/Product.dart';
import '../theme/Colors.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/product-details';
  const ProductDetails({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product? product = ModalRoute.of(context)?.settings.arguments as Product?;
    String title = product?.title ?? 'Products';
    String id = product?.id ?? 'id';
    String description = product?.description ?? 'Products';
    double price = product?.price ?? 0.0;
    String imageUrl = product?.imageUrl ?? 'https://picsum.photos/250?image=9';
    Cart cart = Provider.of<Cart>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Hero(
      tag: id,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: offWhite,
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Image.network(
                      imageUrl, height: MediaQuery.of(context).size.height*0.3, width: double.infinity, fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(child: Text('Error'));
                      },
                    )),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left:10,bottom: 10),
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(title,style: Theme.of(context).textTheme.headline5)),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                mainAxisAlignment: MainAxisAlignment.start,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text('Price:', style: Theme.of(context).textTheme.headline5),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text('$price EGP',style: Theme.of(context).textTheme.subtitle2),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 6,
                                child: SizedBox(
                                    width: width*0.9,
                                    child: Text(description,style: Theme.of(context).textTheme.subtitle2)))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ),
          ),
          Positioned(
            bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.065,
                decoration: const BoxDecoration(
                  color: offWhite,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left:20,right:20.0),
                  child: Center(
                    child: Column(
                      children: [
                        const Divider(
                          height: 5,
                          color: blackish,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: (){
                                  cart.addItem(id, price, title, imageUrl);
                                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: const Text('Added item to cart'),duration: const Duration(milliseconds: 500),elevation: 4,behavior: SnackBarBehavior.floating,margin:
                                  EdgeInsets.only(
                                      bottom: height - 100,
                                      right: 20,
                                      left: width*0.5
                                  ),
                                  )
                                  );
                                },
                                child: const Text('Add to Cart'),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
      )]
      ),
    )
    );
  }
}


