import 'package:flutter/material.dart';
import 'package:flutter_shop/theme/Colors.dart';

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
style: ButtonStyle(
backgroundColor: MaterialStateProperty.all<Color>(shopsyRd),
foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
textStyle: MaterialStateProperty.all<TextStyle>(
const TextStyle(color: offWhite),
)
)
);