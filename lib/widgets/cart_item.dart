import 'package:flutter/material.dart';
import 'package:flutter_shop/theme/Colors.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart';

class CartItemA extends StatelessWidget {
  final String productId;
  final String productName;
  final String quantity;
  final String price;
  final String imageUrl;

  const CartItemA({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    Key ? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 5.0),
      child: Dismissible(
        key: ValueKey(productId),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          cart.removeItem(productId);
        },
        background: Container(
          color: shopsyRd,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: offWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width * 0.53,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        productName,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:5.0, top: 5.0),
                      child: Text(
                        ' $price EGP',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 15
                        ),
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(-15, -5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          int.parse(quantity) > 1 ? IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              cart.removeSingleItem(productId);
                            },
                          ) : IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              cart.removeItem(productId);
                            },
                          ),
                          Text(
                            quantity,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              cart.addItem(productId, double.parse(price), productName, imageUrl);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
