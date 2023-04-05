import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matrimony_app/login.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(
            builder: (context) => LogInScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
              width: 350,
              height: 350,
              child: Image.asset('assets/images/matrimony_logo.jpg')),
        ),
      ),
    );
    throw UnimplementedError();
  }
}