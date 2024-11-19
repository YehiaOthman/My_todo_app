import 'package:flutter/material.dart';
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
      },
      initialRoute: RoutesManger.splashScreen,
    );
  }
}
