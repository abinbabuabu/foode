import 'package:flutter/cupertino.dart';
import 'package:foodie/components/AddressWidget.dart';
import 'package:foodie/components/FoodMenuWidget.dart';
import 'package:foodie/components/ItemTile.dart';
import 'package:foodie/components/SubscriptionTile.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) {
          return FoodMenuWidget();
        });
  }
}

class SampleAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = ["Subscriptions","Address Book","Support","Logout"];
    return Container(
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, i) {
            return ItemTile(text:list[i] ,);
          }),
    );
  }
}

class SampleSubscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = ["Subscriptions","Address Book","Support","Logout"];
    return Container(
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, i) {
            return SubscriptionTile();
          }),
    );
  }
}

class SampleAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = ["Subscriptions","Address Book","Support","Logout"];
    return Container(
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, i) {
            return AddressWidget();
          }),
    );
  }
}



