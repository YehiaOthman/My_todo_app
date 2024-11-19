import 'package:flutter/material.dart';
import 'package:my_todo_app/config/styles/light_app_styles.dart';
import 'package:my_todo_app/core/colors_manger.dart';
import '../../../../core/strings_manger.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedTheme = 'light';
  String selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 1,
            ),
            const Text(
              StringsManger.mode,
              style: LightAppStyles.mode,
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: ColorsManger.secondary , width: 1)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric( vertical: 4, horizontal: 8),
                  child: Row(
                    children: [
                       Text(selectedTheme ,style: const TextStyle(color: ColorsManger.secondary , fontSize: 18),),
                      const Spacer(),
                      buildThemeDropDownMenu(dropDM(item1: 'Light', item2: 'Dark'))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              StringsManger.language,
              style: LightAppStyles.language,
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: ColorsManger.secondary , width: 1)
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4 , horizontal: 8),
                  child: Row(
                    children: [
                       Text(selectedLanguage ,style: const TextStyle(color: ColorsManger.secondary , fontSize: 18),),
                      const Spacer(),
                      buildLanguageDropDownMenu(dropDM(item1: 'Arabic', item2: 'English'))
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
  Widget buildThemeDropDownMenu(dropDM items) => DropdownButton<String>(
    items: <String>[items.item1 , items.item2].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    underline: Container(),
    borderRadius: BorderRadius.circular(12),
    iconEnabledColor: ColorsManger.secondary,
    menuWidth: double.infinity,
    onChanged: (newTheme) {
      selectedTheme = newTheme ?? selectedTheme;
      setState(() {

      });
    },

  );
  Widget buildLanguageDropDownMenu(dropDM items) => DropdownButton<String>(
    items: <String>[items.item1 , items.item2].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    underline: Container(),
    borderRadius: BorderRadius.circular(12),
    iconEnabledColor: ColorsManger.secondary,
    menuWidth: double.infinity,
    onChanged: (newLanguage) {
      selectedLanguage = newLanguage ?? selectedLanguage;
      setState(() {

      });
    },

  );
}

class dropDM{
  String item1;
  String item2;
  dropDM({required this.item1 , required this.item2});
}
