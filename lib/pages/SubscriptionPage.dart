import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:foodie/Provider/FirebaseProvider.dart';
import 'package:foodie/components/BillWidget.dart';
import 'package:foodie/components/Button.dart';
import 'package:foodie/components/TextUndelineWidget.dart';
import 'package:provider/provider.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  List<AddressData> addressList;

  AddressData currentAddress;

  var radioValue = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirebaseProvider>(context);
    addressList = provider.addressList;
    currentAddress = addressList[0];
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextUnderlineWidget(text: "Subscription Starting Date"),
              DatePickerTimeline(DateTime.now(),
                  dayTextStyle:
                      TextStyle(fontFamily: "MontserratB", fontSize: 10),
                  monthTextStyle:
                      TextStyle(fontFamily: "MontserratB", fontSize: 8),
                  dateTextStyle:
                      TextStyle(fontFamily: "MontserratBB", fontSize: 25),
                  selectionColor: Color(0xFFFFE200),
                  onDateChange: (date) {}),
              TextUnderlineWidget(text: "Choose Address"),
              Container(
                padding: EdgeInsets.all(8.0),
                height: 120,
                child: ListView.builder(
                    itemCount: addressList.length,
                    itemBuilder: (context, i) {
                      return Row(
                        children: <Widget>[
                          Radio(
                            groupValue: radioValue,
                            value: i,
                            onChanged: addressChange,
                          ),
                          Text("${addressList[i].locationName.toLowerCase()}")
                        ],
                      );
                    }),
              ),
              TextUnderlineWidget(text: "Total Bill"),
              BillWidget(),
              AccentButton(
                text: "Proceed to Pay",
                listener: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  void addressChange(T) {
    print(T);
    setState(() {
      radioValue = T;
    });

    currentAddress = addressList[T];
  }
}
