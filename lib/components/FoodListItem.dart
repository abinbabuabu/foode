import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: 230,
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
                    height: 36,
                    width: 36,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "26",
                            style: TextStyle(
                                fontFamily: "MontserratBB", fontSize: 13),
                          ),
                          Text(
                            "JAN",
                            style: TextStyle(
                              fontFamily: "MontserratB",
                              fontSize: 8,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
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
