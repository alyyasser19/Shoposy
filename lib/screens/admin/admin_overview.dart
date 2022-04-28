import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/Product.dart';
import '../../providers/Products.dart';
import '../../widgets/product_grid.dart';

class AdminOverview extends StatelessWidget {
  static const String routeName = '/admin/overview';
  const AdminOverview({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider
        .of<Products>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left:5.0),
          child: Center(child: Text('Shopsy', style: Theme.of(context).textTheme.headline5)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 30,
            onPressed: () {
            },
          ),
        ],
      ),
      body:  Center(
        child: FutureBuilder(
          future: products.fetchProducts(),
          builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
              return RefreshIndicator(onRefresh: () { return products.fetchProducts(); },
                  child:  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text('Manage Products:', style: Theme.of(context).textTheme.headline5),
                          ),
                          const SizedBox(height: 10),
                          const Expanded(child: ProductGrid(page: 'admin',)),
                        ],
                      ),
                    ]),
                  ));
            }
          },
        ),
      ),
    );
  }
}
