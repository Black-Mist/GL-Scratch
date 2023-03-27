import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context, rootNavigator: true).pushNamed('login');
    });
    return Scaffold(
      body: Center(
        child: Hero(tag: 'logo', child: Image.asset('assets/getlead_logo.png')),
      ),
    );
  }
}
