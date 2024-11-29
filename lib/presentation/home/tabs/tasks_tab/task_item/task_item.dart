import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo_app/config/styles/light_app_styles.dart';
import 'package:my_todo_app/core/colors_manger.dart';
import 'package:my_todo_app/database_manger/models/todo_model.dart';
import '../../../../../database_manger/models/userDM.dart';
import '../tasks_tab.dart';

class TaskItem extends StatelessWidget {
  TaskItem({super.key , required this.todoModel , required this.onDeleteTask});
  TodoModel todoModel;
  GlobalKey<TasksTabState> taskTabStateKey = GlobalKey();
  Function onDeleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed:(context) {
                  deleteTaskFromFireStore(todoModel);
                  onDeleteTask();
                   // taskTabStateKey.currentState?.getTaskFromFireBase();
                },
                icon: Icons.delete,
                label: 'Delete',
                backgroundColor: Colors.red,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              )
            ],
          ),
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => print('Edit'),
                icon: Icons.edit,
                label: 'Edit',
                backgroundColor: ColorsManger.secondary,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                    width: 5,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        color: ColorsManger.secondary,
                        borderRadius: BorderRadius.circular(15))),
                const Spacer(
                  flex: 1,
                ),
                 Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      todoModel.title,
                      style: LightAppStyles.taskName,
                    ),
                    Text(
                      todoModel.description,
                      style: LightAppStyles.taskDate,
                    )
                  ],
                ),
                const Spacer(
                  flex: 10,
                ),
                InkWell(
                  onTap: () => print('Saved'),
                  enableFeedback: true,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorsManger.secondary),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  deleteTaskFromFireStore(TodoModel todo) async{
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection(UserDM.collectionName).doc(UserDM.currentUserId!.id).collection(TodoModel.collectionName);
    DocumentReference documentReference = collectionReference.doc(todoModel.id);
    await documentReference.delete();
    print('task deleted');

  }
}
