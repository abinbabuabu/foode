import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3D100B),
      body: SafeArea(
          child: Align(
              alignment: Alignment.center,
              child: Container(
                child: Image.asset("assets/img/logo.png"),
              ))),
    );
  }
}
