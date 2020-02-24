import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';

class FoodListItem extends StatelessWidget {
  final String day;
  final String month;
  final String desc;
  final String img;

  FoodListItem({@required this.day, @required this.month,@required this.desc,@required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 120,
                margin: EdgeInsets.only(top: 8.0, right: 12.0, bottom: 8.0),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(
                    image: NetworkImageWithRetry(img),
                    height: 144,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
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
                            day,
                            style: TextStyle(
                                fontFamily: "MontserratBB", fontSize: 13),
                          ),
                          Text(
                            month,
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
              desc,
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
