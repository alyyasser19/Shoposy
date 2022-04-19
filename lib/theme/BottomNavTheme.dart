import 'package:flutter/material.dart';

import 'Colors.dart';

const bottomNav = BottomNavigationBarThemeData(
elevation: 3,
backgroundColor: offWhite,
selectedItemColor: shopsyRd,
unselectedItemColor: offGrey,
showUnselectedLabels: true,
showSelectedLabels: true,
selectedLabelStyle: TextStyle(color: shopsyRd,fontSize: 12, fontWeight: FontWeight.w400),
unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: offGrey),
selectedIconTheme: IconThemeData(color: shopsyRd),
unselectedIconTheme: IconThemeData(color: offGrey),
enableFeedback: true,
type: BottomNavigationBarType.fixed,
);