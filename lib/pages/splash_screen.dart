import 'dart:async';

import 'package:blood_donation/pages/splash_two.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    myTimer();
    super.initState();
  }

  void myTimer() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => SplashTwo()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Center(
          child: CircleAvatar(
            radius: 170,
            backgroundImage: AssetImage('assets/images/bd8.jpg'),
          ),
        ),
      ),
    );
  }
}
