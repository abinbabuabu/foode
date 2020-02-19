import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodie/Provider/LoginProvider.dart';
import 'package:foodie/components/Button.dart';
import 'package:foodie/components/ProfileCard.dart';
import 'package:foodie/components/RouteAnimation.dart';
import 'package:foodie/pages/AccountPage.dart';
import 'package:foodie/pages/DetailsPage.dart';
import 'package:foodie/pages/MapPage.dart';
import 'package:foodie/pages/TabPage.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool _visibility = true;
  String otp;
  final spinKit = SpinKitThreeBounce(
    color: Color(0xFFFFF500),
    size: 30,
  );
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    autoCodeRetrieve();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "OTP verification",
                style: TextStyle(color: Color(0xFF7B4E06)),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: PinPut(
                      fieldsCount: 6,
                      onSubmit: (value) {
                        otp = value;
                        otpSubmit(otp);
                      },
                      actionButtonsEnabled: false,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _visibility,
                child: AccentButton(
                  listener: () {
                    otpSubmit(otp);
                  },
                  text: "Verify",
                ),
              ),
              Visibility(
                visible: !_visibility,
                child: spinKit,
              )
            ],
          ),
        ),
      ),
    );
  }

  autoCodeRetrieve() {
    LoginProvider.stateStream.listen((state) {
      if (state == PhoneAuthState.Verified) {
        FocusScope.of(context).unfocus();
        print("called");
        Navigator.of(_scaffoldKey.currentContext)
            .pushReplacement(MaterialPageRoute(builder: (_){
              return TabPage();
        }));
      } else if (state == PhoneAuthState.newUser) {
        /*
        print(state);
        Navigator.of(_scaffoldKey.currentContext)
            .pushReplacement(SlideRightRoute(
                page: MapPage(
          key: _globalKey,
        )));
         */
      } else {
        /* _displaySnackBar(context, "Login failed!  Try again later ");
        Future.delayed(Duration(seconds: 8),(){
          Navigator.of(_scaffoldKey.currentContext).pushReplacementNamed(HomePage.routeName);
        }) ;

        */
      }
    });
  }

  otpSubmit(String otp) {
    setState(() {
      _visibility = false;
    });
    LoginProvider.signInWithPhoneNumber(otp);
  }
}
