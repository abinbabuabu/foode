import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black,
      child: Row(children: <Widget>[
        Text("Sample"),Icon(Icons.navigate_next)
      ],),
    );
  }
}
