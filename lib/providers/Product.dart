import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class Product with ChangeNotifier {

  late String _id;
  late String _title;
  late String _description;
  late String _imageUrl;
  late Categories _category;
  late double _price;
  late bool _isFavorite;

  Product({required String id, required String title, required String description, required String imageUrl, required double price, required Categories category}){
    _id = id;
    _title = title;
    _description = description;
    _imageUrl = imageUrl;
    _category = category;
    _price = price;
    _isFavorite = false;
  }

  String get id => _id;

  double get price => _price;

  String get imageUrl => _imageUrl;

  String get description => _description;

  String get title => _title;

  String get category => _category.name;

  bool get isFavorite => _isFavorite;

  void updatePrice(double newPrice){
    _price = newPrice;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _category = json['category'];
    _price = json['price'];
    _isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['description'] = _description;
    data['imageUrl'] = _imageUrl;
    data['category'] = _category;
    data['price'] = _price;
    data['isFavorite'] = _isFavorite;
    return data;
  }

  void setFavorite(){
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
  void setID(String id){
    _id = id;
  }

  static Categories getCategory(String category){
    switch(category){
      case 'mouse':
        return Categories.mouse;
      case 'headset':
        return Categories.headset;
      case 'keyboard':
        return Categories.keyboard;
      case 'screen':
        return Categories.screen;
        default:
          return Categories.mouse;
    }
  }
}


enum Categories{
  mouse,
  keyboard,
  screen,
  mousePad,
  headset,
  other
}
