import 'package:flutter/cupertino.dart';
import '../core/colors_manger.dart';


class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              color: ColorsManger.secondary,
            )),
        Expanded(
            flex: 6,
            child: Container(
              color: ColorsManger.primary,
            )),
      ],
    );
  }
}
