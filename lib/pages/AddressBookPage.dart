import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Delete/Sample.dart';
import 'package:foodie/components/Button.dart';
import 'package:foodie/components/RouteAnimation.dart';
import 'package:foodie/pages/MapPage.dart';

class AddressBookPage extends StatelessWidget {
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
          title: Text("Address Book",
              style: TextStyle(
                fontFamily: "MontserratB",
                fontSize: 17,
                color: Colors.white,
              ))),
      body: SafeArea(
          child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Color(0xFF6C3106),
              child: Stack(children: <Widget>[
                Positioned(
                    left: 0,
                    right: 0,
                    top: 4,
                    bottom: 0,
                    child: Container(
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 64),
                              child: SampleAddress(),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AccentButton(
                                  text: "Add Location",
                                  listener: () {
                                    Navigator.pushReplacement(context,
                                        SlideUpRoute(page: MapPage()));
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        padding: EdgeInsets.only(top: 20),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
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
