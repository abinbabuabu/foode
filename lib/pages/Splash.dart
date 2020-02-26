import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/LoginProvider.dart';
import 'package:foodie/components/RouteAnimation.dart';
import 'package:foodie/pages/LoginPage.dart';
import 'package:foodie/pages/TabPage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {
  StreamSubscription _streamSubscription;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    LoginProvider.instantiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 800), () {
      print("LoginStatus Called");
      checkLoginStatus(_scaffoldKey.currentContext);
    });
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Align(
              alignment: Alignment.center,
              child: Container(
                child: Image.asset("assets/img/foodie.jpg",fit: BoxFit.contain,),
              ))),
    );
  }

  void checkLoginStatus(BuildContext Navcontext) {
    _streamSubscription = LoginProvider.stateStream.listen((state) {
      print("called Stream");
      print(state);
      if (state == PhoneAuthState.Failed || state == PhoneAuthState.newUser) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(_scaffoldKey.currentContext).pushReplacement(
              FadeRoute(page: LoginPage()));
        });
      }
      if (state == PhoneAuthState.Verified) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(Navcontext)
              .pushReplacement(FadeRoute(page: TabPage()));
        });
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    _streamSubscription = null;
    super.dispose();
  }
}
