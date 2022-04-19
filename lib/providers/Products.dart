import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Product.dart';

class Products with ChangeNotifier{
 final List<Product> _items= [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      category: Categories.clothes,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
   Product(
     id: 'p4',
     title: 'Wireless Mouse M20',
     description: 'Prepare any meal you want.',
     price: 49.99,
     category: Categories.electronics,
     imageUrl:
     'https://resource.logitech.com/w_692,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/mice/m720/gallery/m720-gallery-1a.png?v=1',
   ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      category: Categories.kitchen,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  List<Product> get items{
    return [..._items];
  }

  List<Product> get favoriteItems{
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  void updateFavorites(){
    notifyListeners();
  }

  void addProduct(Product product){
    _items.add(product);
    notifyListeners();
  }
}