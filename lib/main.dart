import 'package:flutter/material.dart';
import 'package:wed_app/screens/bottom_navigation.dart';
import 'constant.dart';
import 'screens/pre_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       // brightness: Brightness.light,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(color: kPrimaryColor, fontSize: 18),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.9),
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
