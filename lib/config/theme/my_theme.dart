import 'package:flutter/material.dart';

import '../../core/colors_manger.dart';

class MyTheme{
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: ColorsManger.secondary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        size: 28
      ),
      unselectedIconTheme: IconThemeData(
        size: 28
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(
        side:BorderSide(color: Colors.white , width: 5),
      ),
      iconSize: 30
    ),
  );
}