import 'package:flutter/cupertino.dart';
import 'package:foodie/components/FoodMenuWidget.dart';

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
