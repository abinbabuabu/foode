import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/Button.dart';

class ModalBottomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(decoration: InputDecoration(labelText: "Address Name"),),
            SizedBox(
              height: 18,
            ),
            TextFormField(decoration: InputDecoration(labelText: "Location Name")),
            SizedBox(
              height: 18,
            ),
            TextFormField(decoration: InputDecoration(labelText: "Building Name / Door No / Flat No")),
            SizedBox(
              height: 18,
            ),
            TextFormField(decoration: InputDecoration(labelText: "Street Name")),
            SizedBox(
              height: 18,
            ),
            TextFormField(decoration: InputDecoration(labelText: "Land Mark")),
            SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: AccentButton(
                listener: () {
                },
                text: "Add Address",
              ),
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
