import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/Button.dart';
import 'package:foodie/components/Listeners.dart';

class PlanButtonWidget extends StatelessWidget {
  final String days;
  final String price;
  final ButtonClick listener;
  // Listener Required

  PlanButtonWidget({@required this.days, @required this.price,@required this.listener});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 24, right: 24,bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$days DAYS",
                    style: TextStyle(
                        fontFamily: "MontserratB",
                        fontSize: 11,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: price + " ",
                          style: TextStyle(
                              fontFamily: "MontserratBB",
                              fontSize: 20,
                              color: Colors.black)),
                      TextSpan(
                          text: "/ meal",
                          style: TextStyle(
                              fontFamily: "Montseratt",
                              fontSize: 14,
                              color: Colors.grey)),
                    ]),
                  )
                ],
              )),
          Expanded(
              flex: 1,
              child: GreenButton(
                listener: () {
                  listener();
                },
              ))
        ],
      ),
    );
  }
}
