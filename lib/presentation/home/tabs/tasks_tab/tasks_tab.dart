import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/config/styles/light_app_styles.dart';
import 'package:my_todo_app/database_manger/models/todo_model.dart';
import 'package:my_todo_app/database_manger/models/userDM.dart';
import 'package:my_todo_app/presentation/home/tabs/tasks_tab/task_item/task_item.dart';
import 'package:my_todo_app/utils/ex_fun/data_time_format.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => TasksTabState();
}

class TasksTabState extends State<TasksTab> {
  DateTime selectedCardDate = DateTime.now();
  List<TodoModel> todoList = [];

  @override
  void initState() {
    getTaskFromFireBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        EasyInfiniteDateTimeLine(
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            focusDate: selectedCardDate,
            lastDate: DateTime.now().add(const Duration(days: 365)),
            itemBuilder: (context, date, isSelected, onTap) {
              return InkWell(
                onTap: () {
                  selectedCardDate = date;
                  getTaskFromFireBase();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        date.dayName,
                        style: isSelected
                            ? LightAppStyles.selectedEasyCalenderDate
                            : LightAppStyles.unSelectedEasyCalenderDate,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        '${date.day}',
                        style: isSelected
                            ? LightAppStyles.selectedEasyCalenderDate
                            : LightAppStyles.unSelectedEasyCalenderDate,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              );
            }),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  TaskItem(todoModel: todoList[index], onDeleteTask: getTaskFromFireBase,),
              itemCount: todoList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 12,
                  )),
        )
      ],
    );
  }

  getTaskFromFireBase() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(UserDM.collectionName).doc(UserDM.currentUserId!.id).collection(TodoModel.collectionName);
    QuerySnapshot querySnapshot = await collectionReference.get();
    List<QueryDocumentSnapshot> queryDocumentSnapShot = querySnapshot.docs;
    todoList = queryDocumentSnapShot.map(
      (docSnapShot) {
        Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
        TodoModel todo = TodoModel.fromFireStore(json);
        return todo;
      },
    ).toList();
    todoList = todoList
        .where((todo) =>
    todo.date.day == selectedCardDate.day &&
    todo.date.month == selectedCardDate.month &&
    todo.date.year == selectedCardDate.year
    ).toList();
    setState(() {

    });
  }
}
