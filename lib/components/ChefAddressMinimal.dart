import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';

class ChefAddressMinimal extends StatelessWidget {
  final String chefName;
  final String chefAddress;
  final img;

  ChefAddressMinimal(
      {@required this.img, @required this.chefName, @required this.chefAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImageWithRetry(img,),
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    chefName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontFamily: "MontserratB",fontSize: 11),
                  ),
                  Text(
                    chefAddress,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11,color: Color(0xFF6F5E5E)),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
