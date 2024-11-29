import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/core/assets_manger.dart';
import 'package:my_todo_app/core/colors_manger.dart';
import 'package:my_todo_app/core/routes_manger.dart';
import 'package:my_todo_app/core/strings_manger.dart';
import 'package:my_todo_app/database_manger/models/userDM.dart';
import 'package:my_todo_app/presentation/auth/auth_text_form.dart';
import 'package:my_todo_app/utils/helper_fun/helper_fun.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userNameController;

  late TextEditingController passwordController;

  final GlobalKey<FormState> _fromStateKey = GlobalKey();

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
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.auth,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _fromStateKey,
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
                  validator: (value) => defaultValidator(value!),
                  controller: userNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextForm(
                  title: StringsManger.password,
                  label: StringsManger.enterYourPassword,
                  validator: (value) => passwordValidator(value!),
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
                      if (_fromStateKey.currentState!.validate() == false)
                        return;
                      login(context);
                      print('Logged in');
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
      ),
    );
  }

  login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text, password: passwordController.text);
      UserDM.currentUserId = await readUserFromFireStore(credential.user!.uid);
      Navigator.pushReplacementNamed(context, RoutesManger.homeScreen);


    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserDM>readUserFromFireStore(String uid) async{
    CollectionReference userCollection = FirebaseFirestore.instance.collection(UserDM.collectionName);
    DocumentReference userDocuments = userCollection.doc(uid);
    DocumentSnapshot userDocSnapShot = await userDocuments.get();
    Map<String,dynamic> json  = userDocSnapShot.data() as Map<String,dynamic>;
    UserDM userDM  = UserDM.fromFireStore(json);
    return userDM;
  }
}
