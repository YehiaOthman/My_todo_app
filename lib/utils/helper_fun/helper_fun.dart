import 'package:flutter/cupertino.dart';

 isEmailValid(String email) {
  bool valid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  if(valid){
    return null;
  }else{
    return'inValid email format';
  }
}

defaultValidator(String value) {
  if (value == null || value.trim().isEmpty) {
    return 'invalid input';
  } else {
    return null;
  }
}

passwordValidator(String value) {
  if (value == null || value.trim().isEmpty) {
    return 'wrong password';
  } else {
    return null;
  }
}

rePasswordValidator(String value, TextEditingController controller) {
  if (value == null || value.trim().isEmpty) {
    return 'inValid input';
  } else if (value == controller.text) {
    return null;
  } else {
    return'password not match ';
  }
}
