import 'package:flutter/material.dart';

class AuthTextForm extends StatelessWidget {
  AuthTextForm(
      {super.key,
      required this.title,
      required this.label,
      required this.validator,
      required this.controller});

  String label;
  String title;
  FormFieldValidator<String> validator;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 18,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              hintText: label,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              )),
        )
      ],
    );
  }
}
