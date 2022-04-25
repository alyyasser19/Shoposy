import 'package:flutter/material.dart';
import 'package:flutter_shop/theme/Colors.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItemA(
                quantity: cart.items.values.toList()[i].quantity.toString(),
                productName: cart.items.values.toList()[i].title,
                price: cart.items.values.toList()[i].price.toString(),
               imageUrl: cart.items.values.toList()[i].imageUrl,
                productId: cart.items.values.toList()[i].id,
              ),
              ),
            ),
          if (cart.isCartEmpty)  Expanded(
            child: Text('Your Cart Is Empty, Go Ahead and Buy Something!', style: Theme.of(context).textTheme.headline6),
          ) else Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20, top: 3, bottom: 5),
              child: Column(
                children: [
                  const Divider(
                    height: 5,
                    color: blackish,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Text('Subtotal:', style: Theme.of(context).textTheme.headline6,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${cart.totalAmount.toStringAsFixed(2)} EGP', style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 18),),
                          ),
                        ],
                      ),
                      TextButton(
                        child: const Text('ORDER NOW', style: TextStyle(color: shopsyRd)),
                        onPressed: (){},
                      )
                    ],
                  ),
                  const Divider(
                    height: 5,
                    color: blackish,
                  ),
                ],
              ),
            ),
          )
          ,
        ],
      ),
    );
  }
}
