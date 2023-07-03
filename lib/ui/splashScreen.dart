import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled2/ui/ScreenOne.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ScreenOne()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(  'asstes/images/bahyea.jpg',
        ),
      ),
    );
  }
}

