import 'package:flutter/material.dart';
import 'package:my_todo_app/config/styles/light_app_styles.dart';
import 'package:my_todo_app/core/assets_manger.dart';
import 'package:my_todo_app/core/colors_manger.dart';
import 'package:my_todo_app/core/routes_manger.dart';
import 'package:my_todo_app/core/strings_manger.dart';
import 'package:my_todo_app/database_manger/models/todo_model.dart';
import 'package:my_todo_app/utils/ex_fun/data_time_format.dart';

import '../../../../../utils/helper_fun/helper_fun.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    var argus = ModalRoute.of(context)?.settings.arguments as TodoModel;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManger.lightBg))),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pushReplacementNamed(
                  context, RoutesManger.homeScreen),
              child: const Icon(
                Icons.arrow_back_sharp,
              )),
          title: const Text(
            StringsManger.todo,
            style: LightAppStyles.appBar,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        StringsManger.titleEditTask,
                        style: LightAppStyles.bottomSheet
                            .copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        StringsManger.editTaskTitle,
                        style: LightAppStyles.taskName
                            .copyWith(color: Colors.black),
                      ),
                      TextFormField(
                        initialValue: argus.title,
                        onChanged: (value) => argus.title = value,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        StringsManger.editTaskDescription,
                        style: LightAppStyles.taskName
                            .copyWith(color: Colors.black),
                      ),
                      TextFormField(
                        initialValue: argus.description,
                        onChanged: (value) => argus.description = value,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        StringsManger.selectedDate,
                        style: LightAppStyles.taskName
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap:() => setState(() {
                          editData(argus,context);
                        }),
                        child: Text(
                          argus.date.dateFormater,
                          style: LightAppStyles.selectedDate
                              .copyWith(color: Colors.grey.withOpacity(0.8)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManger.secondary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22))),
                            onPressed: () async {
                             await updateTask(argus ,context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                StringsManger.saveChanges,
                                style: LightAppStyles.addTask,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}

