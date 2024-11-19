import 'package:flutter/material.dart';
import '../../core/assets_manger.dart';
import '../../core/routes_manger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, RoutesManger.homeScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AssetsManger.lightSplash,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
