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
              icon:icons[i],
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
    List<String> list = ["Subscriptions", "Address Book", "Support", "Logout"];
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
    List<String> list = ["Subscriptions", "Address Book", "Support", "Logout"];
    return Container(
      child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, i) {
            return AddressWidget();
          }),
    );
  }
}

class SamplePlanner extends StatelessWidget {
  final String plannerId;

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
                print(plannerData.details);
                return FoodListItem();
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}