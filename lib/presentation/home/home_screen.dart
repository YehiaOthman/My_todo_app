import 'package:flutter/material.dart';
import 'package:my_todo_app/core/assets_manger.dart';
import 'package:my_todo_app/presentation/home/bottom_sheet/addTaskBottomSheet.dart';
import 'package:my_todo_app/presentation/home/tabs/setting_tab/settings_tab.dart';
import 'package:my_todo_app/presentation/home/tabs/tasks_tab/tasks_tab.dart';
import '../../config/styles/light_app_styles.dart';
import '../../core/strings_manger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<TasksTabState> tasksTapKey = GlobalKey();
  List<Widget> tabs = [];
  int selectedItem = 0;

  @override
  void initState() {
    super.initState();
    tabs = [
      TasksTab(key: tasksTapKey,),
      const SettingsTab()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsManger.lightBg), fit: BoxFit.cover),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              StringsManger.todo,
              style: LightAppStyles.appBar,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                currentIndex: selectedItem,
                onTap: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: 'list'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'settings'),
                ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await AddTaskBottomSheet.show(context);
              tasksTapKey.currentState?.getTaskFromFireBase();
            },
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: tabs[selectedItem]),
    );
  }
}
