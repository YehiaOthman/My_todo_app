import 'package:flutter/material.dart';
import 'package:my_todo_app/utils/ex_fun/data_time_format.dart';
import '../../../config/styles/light_app_styles.dart';
import '../../../core/colors_manger.dart';
import '../../../core/strings_manger.dart';
import 'myTextFiled/my_text_filed.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();

  static void show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const AddTaskBottomSheet(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        isScrollControlled: true);
  }
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    TextEditingController? taskTitleController;
    TextEditingController? taskDescriptionController;
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                  child: Text(
                StringsManger.bottomSheet,
                style: LightAppStyles.bottomSheet,
              )),
              const Spacer(
                flex: 2,
              ),
              MyTextFiled(
                lable: StringsManger.taskTitle,
                textEditingController: taskTitleController,
              ),
              const Spacer(
                flex: 2,
              ),
              MyTextFiled(
                lable: StringsManger.taskDescription,
                textEditingController: taskDescriptionController,
              ),
              const Spacer(
                flex: 2,
              ),
              const Text(
                StringsManger.selectedDate,
                style: LightAppStyles.selectedDate,
              ),
              Center(
                  child: InkWell(
                      onTap: () => showMyDatePicker(context),
                      child: Text(
                        currentDate.dateFormater,
                        style: LightAppStyles.date,
                      ))),
              const Spacer(
                flex: 2,
              ),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManger.secondary,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  onPressed: () {},
                  child: const Text(
                    StringsManger.addTask,
                    style: LightAppStyles.addTask,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void showMyDatePicker(BuildContext context) async{
    currentDate = await showDatePicker (
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
    ) ?? currentDate;
    setState(() {
    });
  }
}
