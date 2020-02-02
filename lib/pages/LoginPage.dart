import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodie/Provider/LoginProvider.dart';
import 'package:foodie/components/Button.dart';
import 'package:foodie/components/RouteAnimation.dart';
import 'package:foodie/pages/OtpPage.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _visibilityKey = GlobalKey();
  final _focusNode = FocusNode();
  bool _visibility = true;
  var provider;
  String phone;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final spinKit = SpinKitThreeBounce(
    color: Color(0xFFFFF500),
    size: 30,
  );

  @override
  void initState() {
    LoginProvider.instantiate();
    _focusNode.addListener(toggleVisibility);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xFFFFF3DD),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
                margin: EdgeInsets.only(left: 6.0, right: 6.0),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 16.0,
                          spreadRadius: 2.0)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      topLeft: Radius.circular(16.0),
                    )),
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Enter your mobile number",
                      style: TextStyle(color: Color(0xFF754F17)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4.0),
                      child: Form(
                          key: _formKey,
                          child: TextFormField(
                            onChanged: (value){
                              phone = value;
                            },
                            focusNode: _focusNode,
                            validator: (value) {
                              if (value.length != 10) {
                                return "Invalid mobile number ";
                              }
                              return null;
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                              )),
                              prefixText: "+91  ",
                              hintText: "Phone number",
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Visibility(
                      visible: _visibility,
                      child: AccentButton(
                        listener: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _visibility = false;
                            });
                            startPhoneAuth(phone, context);
                            print("Next");
                          }
                        },
                        text: "Next",
                      ),
                    ),
                    Visibility(
                      visible: !_visibility,
                      child: spinKit,
                    ),
                    Container(
                      key: _visibilityKey,
                      height: 1,
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  void toggleVisibility() {
    print("Called Visiblity Check");
    Scrollable.ensureVisible(_visibilityKey.currentContext);
  }

  startPhoneAuth(String phone, BuildContext navcontext) {
    LoginProvider.startAuth(phoneNumber: "+91" + phone);
    LoginProvider.stateStream.listen((state) {
      if (state == PhoneAuthState.CodeSent) {
        Navigator.of(_scaffoldKey.currentContext)
            .pushReplacement(SlideRightRoute(page: OtpPage()));
      }
      if (state == PhoneAuthState.Failed)
        debugPrint("Seems there is an issue with it");
    });
  }
}
