import 'package:flutter/material.dart';
import '../../../../config/styles/light_app_styles.dart';


class MyTextFiled extends StatelessWidget {
   MyTextFiled({super.key , required this.label , required this.textEditingController ,required this.validator});
  String label;
  TextEditingController? textEditingController;
  FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        validator: validator,
        controller: textEditingController ,
        decoration:  InputDecoration(
          label: Text(label, style: LightAppStyles.textFiled,)
        ),
      ),
    );
  }
}
