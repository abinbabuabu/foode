import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black87, width: 1))),
      padding: EdgeInsets.only(left: 16,right: 16,bottom: 22,top: 12),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Subscription Id",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                  )),
              SizedBox(
                height: 6,
              ),
              Text(
                "00121",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "MontserratBB"),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Starting Date",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                  )),
              SizedBox(
                height: 6,
              ),
              Text("22 - 2 -2020",style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: "MontserratBB"))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Ending Date",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                  )),
              SizedBox(
                height: 6,
              ),
              Text("28 - 2 -2020",style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: "MontserratBB"))
            ],
          )
        ],
      ),
    );
  }
}
