import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String mb;

  ProfileCard({@required this.mb});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      color: Theme
          .of(context)
          .accentColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0XFFFFEF32),
                  Color(0xFFffe732),
                  Color(0XFFf5d32c)
                ])),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 24),
          child: Row(
            children: <Widget>[
              Image.asset("assets/img/user.png"),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Mobile Number",
                    style: TextStyle(fontSize: 10, color: Colors.grey),),
                  SizedBox(height: 4,),
                  Text(
                    mb,
                    style: TextStyle(
                        fontFamily: "MontserratB",
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
