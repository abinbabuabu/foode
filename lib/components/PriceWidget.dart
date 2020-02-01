import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  final String days;

  PriceWidget({@required this.days, @required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            days + " DAYS",
            style: TextStyle(
                fontSize: 11,
                color: Color(0xFFADADAD),
                fontFamily: "MontserratBB"),
          ),
          Text(
            "\u20B9" + " " + price,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: "MontserratBB"),
          ),
          Text("per meal",style: TextStyle(
              fontSize: 10,
              color: Color(0xFFADADAD),
              ))
        ],
      ),
    );
  }
}
