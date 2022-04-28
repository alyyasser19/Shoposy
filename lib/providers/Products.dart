import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Product.dart';

class Products with ChangeNotifier{
  List<Product> _items= [
   Product(
     id: 'p2',
     title: 'Wireless Mouse M20',
     description: 'Raise your hand into comfort. Realign into a more natural posture. And relax into focus, all day long with Lift Vertical Ergonomic Mouse — a great fit for small to medium hands, with a left-handed option available too.',
     price: 49.99,
     category: Categories.mouse,
     imageUrl:
     'https://resource.logitech.com/w_692,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/mice/m720/gallery/m720-gallery-1a.png?v=1',
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


  Future<void> fetchProducts()async{
    print('fetchProducts');
    final url = Uri.parse('https://shopsy-4eadc-default-rtdb.europe-west1.firebasedatabase.app/Products.json');
    try{
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if(extractedData == null){
        return ;
      }
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData){
          Categories category = Product.getCategory(prodData['category']);
         try{
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          category: category,
          imageUrl: prodData['imageUrl'],
        ));}
        catch(error){
          print(error);
        }
      });
      _items.clear();
      _items.addAll(loadedProducts);
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
  Future<void> addProduct(Product product) async{
    var url = Uri.parse('https://shopsy-4eadc-default-rtdb.europe-west1.firebasedatabase.app/Products.json');
    http.post(url, body: json.encode({
      'title': product.title,
      'description': product.description,
      'price': product.price,
      'category': product.category,
      'imageUrl': product.imageUrl,
    })).then((response) {
      product.setID(json.decode(response.body)['name']);
      _items.add(product);
      notifyListeners();
    }
    );
  }

  Future<void> deleteProduct(String id) {
    final url = Uri.parse(
        'https://shopsy-4eadc-default-rtdb.europe-west1.firebasedatabase.app/Products/$id.json');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    return http.delete(url).then((value) {
      print('Deleted');
    }).catchError((error) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      print('Error');
    });
  }

  Future<void> modifyProduct(Product product) async{
    print('modifyProduct');
    var url = Uri.parse('https://shopsy-4eadc-default-rtdb.europe-west1.firebasedatabase.app/Products/${product.id}.json');
    http.patch(url, body: json.encode({
      'title': product.title,
      'description': product.description,
      'price': product.price,
      'category': product.category,
      'imageUrl': product.imageUrl,
    })).then((response) {
      print('Modified');
      product.notifyListeners();
    }).catchError((error) {
      print('Error');
    });
  }
}

