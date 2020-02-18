import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/Delete/Sample.dart';
import 'package:foodie/Provider/FirebaseProvider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    print("build called");
    var provider = Provider.of<FirebaseProvider>(context);
    provider.retrieveLunch();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF6C3106),
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF6C3106),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Location",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Address name here",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "MontserratB",
                        fontSize: 16),
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 68,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24.0),
                      topLeft: Radius.circular(24.0),
                    )),
                child: DefaultTabController(
                  child: Scaffold(
                    appBar: PreferredSize(
                    preferredSize: Size.fromHeight(40),
                      child: AppBar(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        flexibleSpace: TabBar(
                          indicatorPadding: EdgeInsets.symmetric(horizontal: 6,vertical: -4),
                          unselectedLabelColor:Color(0xFFCD9B7A) ,
                          labelColor:Color(0xFF653413) ,
                          labelStyle:TextStyle(fontSize: 16,fontFamily: "Montseratt") ,
                          indicatorColor: Color(0xFFF7BE02),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.symmetric(horizontal: 2.0 ),
                          indicatorWeight: 5,
                          tabs: <Widget>[
                            Text("Breakfast",),
                            Text("Lunch"),
                            Text("Dinner")
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(children: <Widget>[
                     Sample(),
                      Sample(),
                      Sample()
                    ],),
                  ), length: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
