import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/BillWidget.dart';
import 'package:foodie/components/Button.dart';
import 'package:foodie/components/TextUndelineWidget.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextUnderlineWidget(text: "Subscription Starting Date"),
              DatePickerTimeline(
                DateTime.now(),
                dayTextStyle: TextStyle(fontFamily: "MontserratB",fontSize: 10),
                monthTextStyle: TextStyle(fontFamily: "MontserratB",fontSize: 8),
                dateTextStyle: TextStyle(fontFamily: "MontserratBB",fontSize: 25),
                selectionColor: Color(0xFFFFE200),
                onDateChange:(date){}
              ),
              TextUnderlineWidget(text:"Choose Address"),
              TextUnderlineWidget(text:"Total Bill"),
              BillWidget(),
              AccentButton(text: "Proceed to Pay",listener: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
