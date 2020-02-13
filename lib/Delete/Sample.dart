import 'package:flutter/cupertino.dart';
import 'package:foodie/components/FoodMenuWidget.dart';
import 'package:foodie/components/ItemTile.dart';

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
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, i) {
            return ItemTile();
          }),
    );
  }
}

