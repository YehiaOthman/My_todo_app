import 'package:flutter/material.dart';
import 'package:my_todo_app/presentation/auth/login_screen/login_screen.dart';
import 'package:my_todo_app/presentation/auth/sign_up_screen/sign_up_screen.dart';
import '../config/theme/my_theme.dart';
import '../core/routes_manger.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.light,
      routes:  {
        RoutesManger.splashScreen :(_) => const SplashScreen(),
        RoutesManger.homeScreen :(_) => const HomeScreen(),
        RoutesManger.loginScreen :(_) => const LoginScreen(),
        RoutesManger.signUpScreen :(_) => const SignUpScreen(),
      },
      initialRoute: RoutesManger.splashScreen,
    );
  }
}
