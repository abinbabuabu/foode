import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:foodie/Provider/FirebaseProvider.dart';
import 'package:foodie/components/BillWidget.dart';
import 'package:foodie/components/Button.dart';
import 'package:foodie/components/RouteAnimation.dart';
import 'package:foodie/components/TextUndelineWidget.dart';
import 'package:foodie/components/date_picker_timeline.dart';
import 'package:foodie/pages/AddressBookPage.dart';
import 'package:foodie/pages/MapPage.dart';
import 'package:foodie/pages/RazorPayPage.dart';
import 'package:provider/provider.dart';

class SubscriptionPage extends StatefulWidget {
  final MealData data;
  final int days;

  SubscriptionPage({@required this.data, this.days});

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  List<AddressData> addressList;
  AddressData currentAddress;
  bool onWeekEnds = false;
  DateTime selectedDate = DateTime.now().add(Duration(days: 1));
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var radioValue = 0;

  @override
  Widget build(BuildContext context) {
    //selectedDate = selectedDate.add(Duration(days: 1));
    var provider = Provider.of<FirebaseProvider>(context, listen: false);
    addressList = provider.addressList;
    if (addressList.isNotEmpty) currentAddress = addressList[0];
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
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
                      child: choose(addressList)),
                  TextUnderlineWidget(text: "Total Bill"),
                  BillWidget(
                    homeName: widget.data.homeName,
                    days: widget.days,
                    price: getAmount(widget.days),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonTheme(
                  height: 43,
                  minWidth: double.infinity,
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () async {
                      if (checkForSatSun()) {
                        provider.getUuid().then((uuid) {
                          makeOrdersData(uuid.uid, uuid.phoneNumber)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                FadeRoute(
                                    page: RazorpayPage(
                                  orderData: value,
                                )));
                          });
                        });
                      }
                    },
                    child: Text(
                      "Proceed to Pay",
                      style: TextStyle(color: Color(0xFF7B4E06)),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            )
          ],
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

  Future<OrderData> makeOrdersData(String uuid, String phoneNumber) async {
    int amountPaid = 0;
    String mealType;

    amountPaid = getAmount(widget.days);

    switch (widget.data.selected) {
      case 0:
        {
          mealType = "breakfast";
          break;
        }
      case 1:
        {
          mealType = "lunch";
          break;
        }
      case 2:
        {
          mealType = "dinner";
          break;
        }
    }

    var order = OrderData.make(
        desc: widget.data.homeDesc,
        phone: phoneNumber,
        amountPaid: amountPaid,
        days: widget.days.toString(),
        mealType: mealType,
        userId: uuid,
        startDate:
            "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
        paymentId: "null",
        address: "${currentAddress.locationName},"
            "${currentAddress.buildingName},"
            "${currentAddress.streetName},"
            "${currentAddress.landMark}",
        chefId: widget.data.chefId,
        weekEnds: onWeekEnds.toString());
    return order;
  }

  bool checkForSatSun() {
    if (!onWeekEnds) {
      if (selectedDate.weekday == 6 || selectedDate.weekday == 7) {
        var snack = SnackBar(
          content:
              Text("Please tick the Check Box to Place Order on Sat / Sun"),
        );
        scaffoldKey.currentState.showSnackBar(snack);
        return false;
      }
    }
    return true;
  }

  int getAmount(int days) {
    switch (days) {
      case 3:
        {
          return widget.data.threeDayCost;
        }
      case 7:
        {
          return widget.data.sevenDayCost;
        }
      case 30:
        {
          return widget.data.thirtyDayCost;
        }
    }
  }

  Widget choose(List<AddressData> list) {
    if (list.isEmpty || list.length == 0) {
      print("list is Empty");
      return Center(
        child: SizedBox(
          height: 40,
          width: 160,
          child: OutlineButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Add Address",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, FadeRoute(page: AddressBookPage()));
            },
            splashColor: Colors.green,
            highlightedBorderColor: Colors.green,
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      );
    } else {
      print(list.length);
      return ListView.builder(
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
                Text("${addressList[i].name}")
              ],
            );
          });
    }
  }
}
