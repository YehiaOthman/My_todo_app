import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/database_manger/models/todo_model.dart';
import 'package:my_todo_app/utils/ex_fun/data_time_format.dart';
import '../../../config/styles/light_app_styles.dart';
import '../../../core/colors_manger.dart';
import '../../../core/strings_manger.dart';
import 'myTextFiled/my_text_filed.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();

  static Future show(BuildContext context) {
    return showModalBottomSheet(
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
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  final GlobalKey<FormState> _formStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formStateKey,
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
                    label: StringsManger.taskTitle,
                    textEditingController: taskTitleController,
                    validator: (input) => titleControllerValidator(input!)),
                const Spacer(
                  flex: 2,
                ),
                MyTextFiled(
                  label: StringsManger.taskDescription,
                  textEditingController: taskDescriptionController,
                  validator: (input) => descriptionControllerValidator(input!),
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
                    onPressed: () {
                      addTaskToFireStore();
                    },
                    child: const Text(
                      StringsManger.addTask,
                      style: LightAppStyles.addTask,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMyDatePicker(BuildContext context) async {
    currentDate = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        ) ??
        currentDate;
    setState(() {});
  }

  addTaskToFireStore() {
    if (_formStateKey.currentState!.validate() == false) return;

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(TodoModel.collectionName);
    DocumentReference documentReference = collectionReference.doc();
    TodoModel todo = TodoModel(
        id: documentReference.id,
        title: taskTitleController.text,
        description: taskDescriptionController.text,
        date: currentDate,
        isDone: false);
    documentReference.set(todo.toFireStore()).timeout(
          const Duration(milliseconds: 500),
          onTimeout: () => {if (mounted) Navigator.pop(context), print('done')},
        );
  }

  titleControllerValidator(String input) {
    if (input == null || input.trim().isEmpty) return 'empty text entered';
    return null;
  }

  descriptionControllerValidator(String input) {
    if (input == null || input.trim().isEmpty) return 'empty text entered';
    return null;
  }
}
