import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo_app/config/styles/light_app_styles.dart';
import 'package:my_todo_app/core/colors_manger.dart';
import '../../../../../core/strings_manger.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

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
                onPressed: (context) => print('Delete'),
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
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      StringsManger.taskName,
                      style: LightAppStyles.taskName,
                    ),
                    Text(
                      StringsManger.taskDate,
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
}
