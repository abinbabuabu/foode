import 'package:flutter/material.dart';
import 'package:foodie/pages/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFB98105),
        accentColor: Color(0xFFFFF500),
        fontFamily: "Montseratt"
      ),
      home: LoginPage()
    );
  }
}

