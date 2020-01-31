import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/Button.dart';
import 'package:foodie/components/ModalBottomDialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Search for a location",
                style: TextStyle(color: Color(0xFF7B4E06)),
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                    disabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor))),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  color: Colors.green,
                  height: MediaQuery.of(context).size.height - 240,
                  child: GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: LatLng(36.0, 36.0)),
                  )),
              SizedBox(
                height: 30,
              ),
              mButton(
                listener: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.only(top: 24,left: 24,right: 24,bottom: MediaQuery.of(context).viewInsets.bottom),
                          decoration: BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16.0),
                            topLeft: Radius.circular(16.0),
                          )),
                          child: ModalBottomDialog(),
                        );
                      });
                },
                text: "Add Location",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
