
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodie/components/Button.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool _visibility = true;
  final spinKit = SpinKitThreeBounce(color: Color(0xFFFFF500),size: 30,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 80,
                    child: PinPut(
                      fieldsCount: 6,
                      onSubmit: _otpSubmit,
                      actionButtonsEnabled: false,
                    )),
              ),
              SizedBox(height: 20,),
              Visibility(
                visible: _visibility,
                child: AccentButton(
                  listener: () {
                    _otpSubmit();
                  },
                  text: "Verify",
                ),
              ),
              Visibility(visible: !_visibility, child:spinKit,)
            ],
          ),
        ),
      ),
    );
  }

  _otpSubmit() {
    setState(() {
      _visibility = false;
    });
  }
}
