import 'package:flutter/material.dart';
import 'package:my_todo_app/utils/helper_fun/helper_fun.dart';
import '../../../core/assets_manger.dart';
import '../../../core/colors_manger.dart';
import '../../../core/routes_manger.dart';
import '../../../core/strings_manger.dart';
import '../auth_text_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController fullNameController;
  late TextEditingController mobilePhoneController;
  late TextEditingController eMailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController = TextEditingController();
    mobilePhoneController = TextEditingController();
    eMailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController.dispose();
    mobilePhoneController.dispose();
    eMailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.auth,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: Image.asset(AssetsManger.auth)),
              AuthTextForm(
                title: StringsManger.fullName,
                label: StringsManger.enterYourFullName,
                validator: (value) {
                  print(value);
                },
                controller: fullNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthTextForm(
                title: StringsManger.mobilePhone,
                label: StringsManger.enterYourMobilePhone,
                validator: (value) {
                  print(value);
                },
                controller: mobilePhoneController,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthTextForm(
                title: StringsManger.eMail,
                label: StringsManger.enterYourEmail,
                validator: (value)  {
                  print(value);
                },
                controller: eMailController,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthTextForm(
                title: StringsManger.password,
                label: StringsManger.enterYourPassword,
                validator: (value) {
                  print(value);
                },
                controller: passwordController,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    print('Sign up');
                    Navigator.pushReplacementNamed(
                        context, RoutesManger.loginScreen);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Text(
                      StringsManger.signUp,
                      style: TextStyle(
                          color: ColorsManger.auth,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
