import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/database_manger/models/userDM.dart';
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
  late TextEditingController userNameController;
  late TextEditingController eMailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  final GlobalKey<FormState> _formStateKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController = TextEditingController();
    userNameController = TextEditingController();
    eMailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    eMailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.auth,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formStateKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Image.asset(AssetsManger.auth)),
                AuthTextForm(
                  title: StringsManger.fullName,
                  label: StringsManger.enterYourFullName,
                  validator: (value) => defaultValidator(value!),
                  controller: fullNameController,
                ),
                const SizedBox(
                  height: 20,
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
                  title: StringsManger.eMail,
                  label: StringsManger.enterYourEmail,
                  validator: (value) => isEmailValid(value!),
                  controller: eMailController,
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
                  height: 20,
                ),
                AuthTextForm(
                  title: StringsManger.rePassword,
                  label: StringsManger.enterYourPassword,
                  validator: (value) =>
                      rePasswordValidator(value!, passwordController),
                  controller: rePasswordController,
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
                      if (_formStateKey.currentState!.validate() == false)
                        return;
                      print('Account created');
                      register();
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
      ),
    );
  }

  register() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: eMailController.text,
        password: passwordController.text,
      );
      addUserToFireStore(credential.user!.uid);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  addUserToFireStore(String uid) {
    UserDM userDM = UserDM(
        id: uid,
        fullName: fullNameController.text,
        userName: userNameController.text,
        eMail: eMailController.text);
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection(UserDM.collectionName);
    DocumentReference userDocuments = userCollection.doc(uid);
    userDocuments.set(userDM.toFireStore());
  }
}
