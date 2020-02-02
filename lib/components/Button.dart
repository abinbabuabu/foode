import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/Listeners.dart';

class AccentButton extends StatelessWidget {
 final  ButtonClick listener;
 final  String text;

  AccentButton({@required this.listener, @required this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 43,
      minWidth: double.infinity,
      child: RaisedButton(
        color: Theme.of(context).accentColor,
        onPressed: () {
          listener();
        },
        child: Text(
          text,
          style: TextStyle(color:Color(0xFF7B4E06)),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  final ButtonClick listener;


  GreenButton({@required this.listener});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 43,
      minWidth: double.infinity,
      child: RaisedButton(
        color: Color(0xFF2CC349),
        onPressed: () {
          listener();
        },
        child: Text(
          "Choose",
          style: TextStyle(color:Colors.white,fontFamily: "MontserratBB"),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
