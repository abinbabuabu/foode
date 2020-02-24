import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';

class AddressWidget extends StatelessWidget {
  final AddressData addressData;

  AddressWidget({@required this.addressData});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 4,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    addressData.name,
                    style: TextStyle(fontFamily: "MontserratB", fontSize: 16),
                  ),
                  Text(
                    addressData.locationName + ", " + addressData.buildingName +
                        ", " + addressData.streetName + ", " + addressData.landMark,
                    maxLines: 3,
                    style: TextStyle(height: 1.5, color: Color(0xFF424241)),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Expanded(flex: 2, child: Container())
          ],
        ),
      ),
    );
  }
}
