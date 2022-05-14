import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier{
  late String? _token;
  late String _userId;
  late DateTime _expiryDate;

  bool get isAuth{
    return _token != null;
  }

  String? get token{
    if( _expiryDate.isAfter(DateTime.now()) && _token != null){
      return _token;
    }
    return null;
  }

  String get userId{
    return _userId;
  }

  Future signup({required String email,required String password, required String name, required String surname, required String phone, required String country }) async{
    var url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCZTl5C3jU5-lwqzTBLj8rgniak3lGKytM');
      final response = await http.post(url, body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true
      }));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
        return responseData;
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));

      var url2 = Uri.parse('https://shopsy-4eadc-default-rtdb.europe-west1.firebasedatabase.app/Users.json');
      await http.post(url2, body: json.encode({
        'name': name[0].toUpperCase() + name.substring(1),
        'surname': surname[0].toUpperCase() + surname.substring(1),
        'email': email.toLowerCase(),
        'phone': phone,
        'country': country,
        'userId': _userId,
        'token': _token,
        'admin': true,
      }));
      notifyListeners();
      return {'success': true};
  }

  Future login({required String email,required String password}) async{
    var url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCZTl5C3jU5-lwqzTBLj8rgniak3lGKytM');
      final response = await http.post(url, body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true
      }));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
        print(responseData['error']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
      final url2 = Uri.parse('https://shopsy-4eadc-default-rtdb.europe-west1.firebasedatabase.app/Users.json?orderBy="email"&startAt="$email"&endAt="$email"');
      final response2 = await http.get(url2);
      final responseData2 = json.decode(response2.body);
      // print(responseData2[responseData2.keys.first]['admin']);
      print(responseData2.values.toList()[0]['admin']);
      if(responseData2 == null){
        return {'success': false, 'message': 'User not found'};
      }
      notifyListeners();
      return {'success': true, 'admin': responseData2.values.toList()[0]['admin']};
  }



}