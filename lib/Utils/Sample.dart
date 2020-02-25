import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:foodie/Provider/FirebaseProvider.dart';
import 'package:foodie/Utils/customicons_icons.dart';
import 'package:foodie/components/AddressWidget.dart';
import 'package:foodie/components/FoodListItem.dart';
import 'package:foodie/components/FoodMenuWidget.dart';
import 'package:foodie/components/ItemTile.dart';
import 'package:foodie/components/RouteAnimation.dart';
import 'package:foodie/components/SubscriptionTile.dart';
import 'package:foodie/pages/AddressBookPage.dart';
import 'package:foodie/pages/LoginPage.dart';
import 'package:foodie/pages/SubscriptionDetailsPage.dart';
import 'package:provider/provider.dart';

class SampleLunch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirebaseProvider>(context);
    return FutureBuilder(
      future: provider.retrieveLunch(),
      builder: (context, list) {
        if (list.hasData) {
          return ListView.builder(
              itemCount: list.data.length,
              itemBuilder: (context, i) {
                MealData data = list.data[i];
                return FoodMenuWidget(
                  data: data,
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class SampleBreakFast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirebaseProvider>(context);
    return FutureBuilder(
      future: provider.retrieveBreakFast(),
      builder: (context, list) {
        if (list.hasData) {
          return ListView.builder(
              itemCount: list.data.length,
              itemBuilder: (context, i) {
                MealData breakFastData = list.data[i];
                return FoodMenuWidget(
                  data: breakFastData,
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class SampleDinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirebaseProvider>(context);
    return FutureBuilder(
      future: provider.retrieveDinner(),
      builder: (context, list) {
        if (list.hasData) {
          return ListView.builder(
              itemCount: list.data.length,
              itemBuilder: (context, i) {
                MealData dinnerDataData = list.data[i];
                return FoodMenuWidget(
                  data: dinnerDataData,
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class SampleAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = ["Subscriptions", "Address Book", "Support", "Logout"];
    List<IconData> icons = [
      Customicons.subscribe,
      Customicons.notebook,
      Customicons.support,
      Customicons.logout
    ];
    return Container(
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, i) {
            return ItemTile(
              text: list[i],
              icon: icons[i],
              listener: () {
                switch (i) {
                  case 0:
                    {
                      Navigator.push(
                          context, FadeRoute(page: SubscriptionDetailsPage()));
                      break;
                    }
                  case 1:
                    {
                      Navigator.push(
                          context, FadeRoute(page: AddressBookPage()));
                      break;
                    }
                  case 3:
                    {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushReplacement(
                            context, SlideRightRoute(page: LoginPage()));
                      });
                      break;
                    }
                }
              },
            );
          }),
    );
  }
}

class SampleSubscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirebaseProvider>(context);
    return FutureBuilder(
        future: provider.getSubscription(),
        builder: (context, list) {
          if (list.hasData) {
            return Container(
              child: ListView.builder(
                  itemCount: list.data.length,
                  itemBuilder: (context, i) {
                    SubscriptionData _sub = list.data[i];
                    return SubscriptionTile(
                      id: _sub.id,
                      startDate: S.dateToString(_sub.startDate),
                      endDate: S.dateToString(_sub.endDate),
                    );
                  }),
            );
          } else {
            print("Sample Subscription is null");
            return Container();
          }
        });
  }
}

class SampleAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirebaseProvider>(context);
    return FutureBuilder(
      future: provider.getAddresses(),
      builder: (context, list) {
        if (list.hasData) {
          return Container(
            child: ListView.builder(
                itemCount: list.data.length,
                itemBuilder: (context, i) {
                  AddressData data = list.data[i];
                  return AddressWidget(
                    listener: () {
                      provider.deleteAddress(data.key).then((_) {
                        Navigator.pushReplacement(
                            context, FadeRoute(page: AddressBookPage()));
                      });
                    },
                    addressData: data,
                  );
                }),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class SamplePlanner extends StatelessWidget {
  final String plannerId;
  List<String> monthList = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];

  SamplePlanner({@required this.plannerId});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirebaseProvider>(context);
    return FutureBuilder(
      future: provider.getPlannerDetails(plannerId),
      builder: (context, list) {
        if (list.hasData) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.data.length,
              itemBuilder: (context, i) {
                PlannerData plannerData = list.data[i];
                DateTime date = plannerData.date;
                print(date);
                return FoodListItem(
                  img: plannerData.img,
                  desc: plannerData.details,
                  day: date.day.toString(),
                  month: monthList[date.month - 1],
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
