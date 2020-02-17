import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Delete/Sample.dart';

class SubscriptionDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop()),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF6C3106),
          title: Text("Subscription",
              style: TextStyle(
                fontFamily: "MontserratB",
                fontSize: 17,
                color: Colors.white,
              ))),
      body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF6C3106),
              child: Stack(children: <Widget>[
                Positioned(
                    left: 0,
                    right: 0,
                    top: 4,
                    bottom: 0,
                    child: Container(
                        child: SampleAccount(),
                        padding: EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24.0),
                            topLeft: Radius.circular(24.0),
                          ),
                        ))),
              ]))),
    );
  }
}
