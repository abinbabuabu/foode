import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/FirebaseProvider.dart';
import 'package:foodie/components/Button.dart';
import 'package:provider/provider.dart';
import 'package:foodie/Provider/Dataclass.dart';

class ModalBottomDialog extends StatefulWidget {
  @override
  _ModalBottomDialogState createState() => _ModalBottomDialogState();
}

class _ModalBottomDialogState extends State<ModalBottomDialog> {
  final _formKey = GlobalKey<FormState>();
  String locationName, buildingName, streetName, landMark;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Location Name"),
              onChanged: (val) {
                locationName = val;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Required Field";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
                decoration: InputDecoration(
                    labelText: "Building Name / Door No / Flat No"),
                onChanged: (val) {
                  buildingName = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Required Field";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 18,
            ),
            TextFormField(
                decoration: InputDecoration(labelText: "Street Name"),
                onChanged: (val) {
                  streetName = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Required Field";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Land Mark"),
              onChanged: (val) {
                landMark = val;
              },
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: AccentButton(
                listener: () {
                  if (_formKey.currentState.validate()) {
                    var provider = Provider.of<FirebaseProvider>(context,listen: false);
                    var addressData = AddressData(
                        buildingName: buildingName,
                        locationName: locationName,
                        streetName: streetName);
                    provider.addAddress(addressData);
                  }
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
