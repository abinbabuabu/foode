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
  bool onWeekEnds = false;
  DateTime selectedDate = DateTime.now();

  var radioValue = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirebaseProvider>(context);
    addressList = provider.addressList;
    currentAddress = addressList[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 8.0, left: 8.0),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextUnderlineWidget(text: "Subscription Starting Date"),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DatePickerTimeline(selectedDate,
                    dayTextStyle:
                    TextStyle(fontFamily: "MontserratB", fontSize: 10),
                    monthTextStyle:
                    TextStyle(fontFamily: "MontserratB", fontSize: 8),
                    dateTextStyle:
                    TextStyle(fontFamily: "MontserratBB", fontSize: 25),
                    selectionColor: Color(0xFFFFE200),
                    onDateChange: (date) {
                      selectedDate = date;
                    }),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.green,
                    value: onWeekEnds,
                    onChanged: (value) {
                      setState(() {
                        onWeekEnds = value;
                      });
                    },
                  ),
                  Text("Delivery on Saturday and Sunday")
                ],
              ),
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
                            activeColor: Colors.green,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AccentButton(
                  text: "Proceed to Pay",
                  listener: () {
                    provider.postOrder(makeOrdersData());
                  },
                ),
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

  OrderData makeOrdersData() {
    var order = OrderData.make(amountPaid: "120",
        days: "12",
        mealType: "breakfast",
        userId: "sample",
        paymentId: "sample",
        address: "sample",
        startDate: "sample",
        chefId: "sample",
        weekEnds: true);
    return order;
  }


}
