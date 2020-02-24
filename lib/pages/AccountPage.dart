import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/FirebaseProvider.dart';
import 'package:foodie/Utils/Sample.dart';
import 'package:foodie/components/ProfileCard.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirebaseProvider>(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: Color(0xFF6C3106),
            child: Stack(children: <Widget>[
              Positioned(top: 0,
                  left: 0,
                  right: 0,
                  child: FutureBuilder(
                    future: provider.getUuid(), builder: (context,list){
                      if(list.hasData){
                        FirebaseUser user = list.data;
                        return ProfileCard(mb:user.phoneNumber,);
                      }
                      else{
                        return ProfileCard(mb:"XXXXXXXXXX",);
                      }
                  },)),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 100,
                  bottom: 0,
                  child: Container(
                      child: SampleAccount(),
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
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Center(
                    child: Text(
                      "Designed & Developed by Emilda",
                      style: TextStyle(color: Colors.grey, fontSize: 7),
                    )),
              )
            ]),
          ),
        ));
  }
}
