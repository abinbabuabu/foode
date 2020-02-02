import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodie/components/Divider.dart';
import 'package:foodie/components/FoodListItem.dart';
import 'package:foodie/components/PlanButtonWidget.dart';
import 'package:foodie/components/TextUndelineWidget.dart';

class MealDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double _topHeight = height / 4;
    double _bottomHeight = height - _topHeight - 24;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    height: _topHeight,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: _topHeight / 2,
                        ),
                        TextUnderlineWidget(
                          text: "View Plan",
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, i) {
                                return FoodListItem();
                              }),
                        ),
                        TextUnderlineWidget(
                          text: "Homely - Sai Nagar",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12)),
                            height: 138,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextUnderlineWidget(text: "Choose the plan",),
                        SizedBox(height: 26,),
                        PlanButtonWidget(days: "3",price: "180",),
                        PlanButtonWidget(days: "7",price: "320",),
                        PlanButtonWidget(days: "30",price: "570",)
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  top: _topHeight - 40,
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
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey),
                                  maxLines: 4,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
