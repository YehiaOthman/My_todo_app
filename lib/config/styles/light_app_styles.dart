import 'package:flutter/material.dart';

import '../../core/colors_manger.dart';

class LightAppStyles {
  static const TextStyle appBar = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  static const TextStyle bottomSheet = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  static const TextStyle textFiled = TextStyle(
      fontSize: 15,
      color: Colors.grey,
    );
  static const TextStyle selectedDate = TextStyle(
      fontSize: 18,
      color: Colors.black,
    );
  static const TextStyle date = TextStyle(
      fontSize: 18,
      color: Colors.grey,
    );
  static const TextStyle addTask = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  static const TextStyle mode = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  static const TextStyle language = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  static const TextStyle taskName = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorsManger.secondary,
    );
  static const TextStyle taskDate = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  static const TextStyle unSelectedEasyCalenderDate = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  static const TextStyle selectedEasyCalenderDate = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorsManger.secondary,
    );
}
