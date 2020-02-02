import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/Provider/LoginProvider.dart';
import 'package:foodie/pages/DetailsPage.dart';
import 'package:foodie/pages/LoginPage.dart';
import 'package:foodie/pages/MealDetailPage.dart';
import 'package:foodie/pages/Splash.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(display1: TextStyle(color:Color(0xFF7B4E06) )),
        primaryColor: Color(0xFFB98105),
        accentColor: Color(0xFFFFF500),
        canvasColor: Colors.transparent,
        fontFamily: "Montseratt"
      ),
      home:MealDetailPage()
    );
  }
}

