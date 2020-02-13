import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Delete/Sample.dart';
import 'package:foodie/components/ProfileCard.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    var db = FirebaseDatabase.instance.reference();
    FirebaseAuth.instance.currentUser().then((value){
      db.child("Users").push().set(<String,String>{
        "uuid":value.uid,
        "phone":value.phoneNumber
      });
    });
     */
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Stack(children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 30),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: Color(0xFF6C3106),
                child: ProfileCard(),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 100,
                  bottom: 0,
                  child: Container(
                      child: Sample(),
                      padding: EdgeInsets.only(top: 20),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24.0),
                          topLeft: Radius.circular(24.0),
                        ),)
                  )),
            ])));
  }
}
