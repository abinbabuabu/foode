import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:foodie/components/ChefAddressMinimal.dart';
import 'package:foodie/components/Divider.dart';
import 'package:foodie/components/PriceWidget.dart';
import 'package:foodie/components/RouteAnimation.dart';
import 'package:foodie/pages/MealDetailPage.dart';

class FoodMenuWidget extends StatelessWidget {
  final MealData data;

  FoodMenuWidget({@required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(FadeRoute(
            page: MealDetailPage(
          data: data,
        )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder:"assets/img/placeholder.jpg",
              image: data.coverImgUrl,
              height: 144,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                data.displayName,
                style: TextStyle(fontFamily: "MontserratBB"),
              ),
            ),
            ChefAddressMinimal(
              img: data.chefImgUrl,
              chefName: data.homeName,
              chefAddress: data.homeDesc,
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PriceWidget(
                  days: "3",
                  price: data.threeDayCost.toString(),
                ),
                mDivider(
                  color: 0xFF707070,
                  height: 36,
                  width: 2,
                ),
                PriceWidget(
                  days: "7",
                  price: data.sevenDayCost.toString(),
                ),
                mDivider(
                  color: 0xFF707070,
                  height: 36,
                  width: 2,
                ),
                PriceWidget(
                  days: "30",
                  price: data.thirtyDayCost.toString(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
