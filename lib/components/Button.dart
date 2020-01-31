import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/Listeners.dart';

class mButton extends StatelessWidget {
  ButtonClick listener;
  String text;

  mButton({@required this.listener, @required this.text});

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
