import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/ChefAddressMinimal.dart';
import 'package:foodie/components/Divider.dart';
import 'package:foodie/components/PriceWidget.dart';

class FoodMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(side:BorderSide(color: Colors.black,width: 0.2),borderRadius: BorderRadius.circular(12),),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.grey,
            height: 144,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Sublime North & South Indian Non Veg Mini Meal Plan",
              style: TextStyle(fontFamily: "MontserratBB"),
            ),
          ),
          ChefAddressMinimal(
            chefName: "Homely - Sai Nagar",
            chefAddress: "Freshly made, homestyle meals delivered with love",
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              PriceWidget(
                days: "3",
                price: "89",
              ),
              mDivider(color: 0xFF707070,height: 36,width: 2,),
              PriceWidget(
                days: "7",
                price: "99",
              ),
              mDivider(color: 0xFF707070,height: 36,width: 2,),
              PriceWidget(
                days: "30",
                price: "102",
              )
            ],
          )
        ],
      ),
    );
  }
}
