import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Listeners.dart';

class ItemTile extends StatelessWidget {
  final String text;
  final ButtonClick listener;
  final IconData icon;

  ItemTile({@required this.text, @required this.listener, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      height: 60,
      margin: EdgeInsets.only(left: 18.0, right: 18.0),
      child: Material(
        child: InkWell(
          onTap: () {
            listener();
          },
          child: Container(
            padding: EdgeInsets.only(left: 6.0, right: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon,color: Colors.grey,),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      text,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                Icon(
                  Icons.navigate_next,
                  color: Colors.black54,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
