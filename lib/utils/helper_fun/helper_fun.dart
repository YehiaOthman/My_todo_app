import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/core/routes_manger.dart';
import 'package:my_todo_app/database_manger/models/userDM.dart';
import '../../database_manger/models/todo_model.dart';

isEmailValid(String email) {
  bool valid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (valid) {
    return null;
  } else {
    return 'inValid email format';
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
    return 'password not match ';
  }
}

editData(TodoModel argus, BuildContext context) async {
  var newSelectedDate = await showDatePicker(
    context: context,
    firstDate: DateTime.now(),
    initialDate: argus.date,
    lastDate: DateTime.now().add(const Duration(days: 365)),
  );
  if (newSelectedDate != null) {
    argus.date = newSelectedDate;
  }
}

getCollection() {
  CollectionReference todoCollection = FirebaseFirestore.instance
      .collection(UserDM.collectionName)
      .doc(UserDM.currentUserId!.id)
      .collection(TodoModel.collectionName);

  return todoCollection;
}

updateTask(TodoModel todo ,context) async {
  CollectionReference todoCollection = getCollection();
  DocumentReference todoDocuments = todoCollection.doc(todo.id);
  await todoDocuments.update(todo.toFireStore());
  Navigator.pushReplacementNamed(context, RoutesManger.homeScreen);
}

isDone(TodoModel todo) async {
  CollectionReference todoCollection = getCollection();
  DocumentReference todoDocuments = todoCollection.doc(todo.id);
  await todoDocuments.update({'isDone' : !todo.isDone});
}
