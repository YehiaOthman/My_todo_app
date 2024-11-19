import 'package:flutter/material.dart';
import '../../../../config/styles/light_app_styles.dart';


class MyTextFiled extends StatelessWidget {
   MyTextFiled({super.key , required this.lable , required this.textEditingController});
  String lable;
  TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: textEditingController ,
        onChanged: (value) => print(value),
        decoration:  InputDecoration(
          label: Text(lable, style: LightAppStyles.textFiled,)
        ),
      ),
    );
  }
}
