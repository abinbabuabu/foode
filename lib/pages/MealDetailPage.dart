import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/Divider.dart';

class MealDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double _topHeight = height / 4;
    double _bottomHeight = height - _topHeight - 24;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    height: _topHeight,
                  ),
                ],
              ),
            ),
            Positioned(
                top: 120,
                right: 0,
                left: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 14.0, right: 10.0, left: 10.0, bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Sublime North & South Indian Non Veg Mini Meal Plan",
                                style: TextStyle(
                                    fontFamily: "MontserratBB", fontSize: 15),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              mDivider(
                                color: 0xFFFFD00A,
                                height: 4,
                                width: 92,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd",
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                                maxLines: 4,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(padding: EdgeInsets.all(16.0),child: Column(
                      children: <Widget>[

                      ],
                    ),)
                    Text("View Plan"),
                    mDivider(color: 0xFFFFD00A,
                      height: 4,
                      width: 92,)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
