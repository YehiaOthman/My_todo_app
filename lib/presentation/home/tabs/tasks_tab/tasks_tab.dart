import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/config/styles/light_app_styles.dart';
import 'package:my_todo_app/presentation/home/tabs/tasks_tab/task_item/task_item.dart';
import 'package:my_todo_app/utils/ex_fun/data_time_format.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedCardDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyInfiniteDateTimeLine(
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          focusDate: selectedCardDate,
          lastDate: DateTime.now().add(const Duration(days: 365)),
          itemBuilder: (context, date, isSelected, onTap) {
            return InkWell(
              onTap: () {
                selectedCardDate = date;
                setState(() {

                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white ,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(flex: 1,),
                    Text(date.dayName ,style: isSelected ? LightAppStyles.selectedEasyCalenderDate : LightAppStyles.unSelectedEasyCalenderDate,),
                    const Spacer(flex: 2,),
                    Text('${date.day}' ,style: isSelected?LightAppStyles.selectedEasyCalenderDate: LightAppStyles.unSelectedEasyCalenderDate,),
                    const Spacer(flex: 1,),
                  ],
                ),
              ),
            );
          }
        ),
        const SizedBox(
          height: 20,
        ),
        const TaskItem()
      ],
    );
  }
}
