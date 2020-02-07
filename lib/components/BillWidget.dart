import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/Divider.dart';

class BillWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Text(
                    "Homely - Sai Nagar",
                    style: TextStyle(fontFamily: "MontserratB"),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    "247 X 2",
                    style: TextStyle(fontFamily: "MontserratBB"),
                  ))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          mDivider(
            height: 2,
            color: 0xFF707070,
          ),
          SizedBox(
            height: 16,
          ),
          Text("Total : ₹ 420",style: TextStyle(color: Color(0XFF056E15)),)
        ],
      ),
    );
  }
}
