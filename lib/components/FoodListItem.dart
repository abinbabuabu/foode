import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 260,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 120,
                margin: EdgeInsets.only(top: 8.0, right: 12.0, bottom: 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey),
              ),
              Positioned(
                  right: 24,
                  bottom: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFFACD35)),
                    height: 30,
                    width: 40,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              "White Rice and 16 types of side masala’s Dala fried",
              style: TextStyle(fontSize: 10, fontFamily: "MontserratBB"),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
