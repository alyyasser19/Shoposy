import 'package:flutter/material.dart';

import 'Colors.dart';

InputDecorationTheme inputDecoration = const InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  border: OutlineInputBorder(
    borderSide: BorderSide(
    color: blackish,
  ),
  ),
  floatingLabelStyle: TextStyle(
    color: shopsyRd,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  ),
  labelStyle: TextStyle(
    color: shopsyRd,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: blackish,
    ),
  ),
  helperStyle: TextStyle(
    color: offGrey,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.8,
  ),
  hintStyle: TextStyle(
    color: offGrey,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.8,
  ),
  );