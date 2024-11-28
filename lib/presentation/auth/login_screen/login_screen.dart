import 'package:flutter/material.dart';
import 'package:my_todo_app/core/assets_manger.dart';
import 'package:my_todo_app/core/colors_manger.dart';
import 'package:my_todo_app/core/routes_manger.dart';
import 'package:my_todo_app/core/strings_manger.dart';
import 'package:my_todo_app/presentation/auth/auth_text_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userNameController ;
  late TextEditingController passwordController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
     passwordController = TextEditingController();
  }
  @override

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose() ;
    passwordController.dispose() ;
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
            children: [
              Center(child: Image.asset(AssetsManger.auth)),
              const Text(
                StringsManger.authTitle,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),
              const Text(
                StringsManger.authTitle2,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),
              AuthTextForm(
                title: StringsManger.userName,
                label: StringsManger.enterYourName,
                validator: (value) {
                  print(value);
                },
                controller: userNameController,
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
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  InkWell(
                      onTap: () => print('forgot password'),
                      child: const Text(
                        StringsManger.forgetPassword,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ))
                ],
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
                    print('Login in');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Text(
                      StringsManger.login,
                      style: TextStyle(
                          color: ColorsManger.auth,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutesManger.signUpScreen);
                },
                child: const Text(
                  StringsManger.createAccount,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
