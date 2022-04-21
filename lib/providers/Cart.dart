
import 'package:flutter/material.dart';


class CartItem{
  final String id;
  final String title;
  final String imageUrl;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  @override
  String toString(){
    return 'CartItem{id: $id, title: $title, quantity: $quantity, price: $price}';
  }
}




class Cart with ChangeNotifier{
  late Map<String, CartItem> _items={};

  Map<String, CartItem> get items{
    return {..._items};
  }

  void addItem(String productId, double price, String title, String imageUrl){
    if(_items.containsKey(productId)){
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
          imageUrl: existingCartItem.imageUrl,
        ),
      );
    }else{
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: productId,
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId){
    if(!_items.containsKey(productId)){
      return;
    }
    if(_items[productId]?.quantity as int > 1){
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
          imageUrl: existingCartItem.imageUrl,
        ),
      );
    }else{
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  bool get isCartEmpty{
    return _items.isEmpty;
  }

  bool checkItem(String productId){
    return _items.containsKey(productId);
  }

  int get itemCount{
    int count = 0;
    _items.forEach((key, cartItem) {
      count += cartItem.quantity;
    });
    return count;
  }

  int getItemQuantity(String productId){
    return _items[productId]?.quantity as int;
  }

}