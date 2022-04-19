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

  Categories get category => _category;

  bool get isFavorite => _isFavorite;

  void updatePrice(double newPrice){
    _price = newPrice;
  }

  void setFavorite(){
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
}

enum Categories{
  electronics,
  furniture,
  clothes,
  books,
  kitchen,
  others
}