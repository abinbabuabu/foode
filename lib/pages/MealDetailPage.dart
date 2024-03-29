import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image/network.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:foodie/Utils/Sample.dart';
import 'package:foodie/components/Divider.dart';
import 'package:foodie/components/PlanButtonWidget.dart';
import 'package:foodie/components/RouteAnimation.dart';
import 'package:foodie/components/TextUndelineWidget.dart';
import 'package:foodie/pages/SubscriptionPage.dart';

class MealDetailPage extends StatelessWidget {
  final MealData data;

  MealDetailPage({@required this.data});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double _topHeight = height / 4;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image(
                    image: NetworkImageWithRetry(data.coverImgUrl),
                    height: _topHeight,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: _topHeight / 2 + 20,
                        ),
                        TextUnderlineWidget(
                          text: "View Plan",
                        ),
                        Container(
                            height: 200,
                            width: double.infinity,
                            child: SamplePlanner(
                              plannerId: getPlannerId(data),
                            )),
                        TextUnderlineWidget(
                          text: data.homeName,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8),
                          child: Text(
                            data.homeDesc,
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: 152,
                            width: double.infinity,
                            child: CarouselSlider(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                pauseAutoPlayOnTouch: Duration(seconds: 1),
                                enableInfiniteScroll: true,
                                items: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image(
                                        image: NetworkImageWithRetry(
                                            data.dis1ImgUrl),
                                        height: _topHeight,
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image(
                                        image: NetworkImageWithRetry(
                                            data.dis2ImgUrl),
                                        height: _topHeight,
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image(
                                        image: NetworkImageWithRetry(
                                            data.dis3ImgUrl),
                                        height: _topHeight,
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextUnderlineWidget(
                          text: "Choose the plan",
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        PlanButtonWidget(
                          days: "3",
                          price: data.threeDayCost.toString(),
                          listener: () {
                            Navigator.of(context).push(FadeRoute(
                                page: SubscriptionPage(
                              data: data,
                              days: 3,
                            )));
                          },
                        ),
                        PlanButtonWidget(
                          days: "7",
                          price: data.sevenDayCost.toString(),
                          listener: () {
                            Navigator.of(context).push(FadeRoute(
                                page: SubscriptionPage(
                              data: data,
                              days: 7,
                            )));
                          },
                        ),
                        PlanButtonWidget(
                          days: "30",
                          price: data.thirtyDayCost.toString(),
                          listener: () {
                            Navigator.of(context).push(FadeRoute(
                                page: SubscriptionPage(
                              data: data,
                              days: 30,
                            )));
                          },
                        )
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
                        width: double.infinity,
                        height: 140,
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
                                  data.displayName,
                                  style: TextStyle(
                                      fontFamily: "MontserratBB", fontSize: 15),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                selectUnderLine(data.displayName),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  data.briefDesc,
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
                  )),
              Positioned(
                left: 4,
                top: 6,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getPlannerId(MealData data) {
    int selected = data.selected;
    if (selected == 0)
      return data.breakfastPlannerId;
    else if (selected == 1)
      return data.lunchPlannerId;
    else
      return data.dinnerPlannerId;
  }

  Widget selectUnderLine(String name) {
    if (name.length > 20)
      return mDivider(
        color: 0xFFFFD00A,
        height: 4,
        width: 102,
      );
    else {
      return mDivider(
        color: 0xFFFFD00A,
        height: 4,
        width: name.length * 7.2,
      );
    }
  }
}
