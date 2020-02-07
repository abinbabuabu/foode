import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';

class SearchItem extends StatelessWidget {
  PredictionResult item;
  bool iconVisibility = true;

  SearchItem({@required this.item, this.iconVisibility});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 16, left: 20),
        height: 66,
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Visibility(
              child: Icon(
                Icons.location_on,
                color: Colors.black38,
              ),
              visible: iconVisibility,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
                  item.name,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black87),
                )),
          ],
        ));
  }
}
