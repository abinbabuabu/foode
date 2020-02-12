import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:foodie/Provider/MapProvider.dart';
import 'package:foodie/components/Button.dart';
import 'package:foodie/components/ModalBottomDialog.dart';
import 'package:foodie/components/SearchDelegate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  MapPage({Key key}) : super(key: key);
  PredictionResult clickedResult;
  static const LatLng _center = const LatLng(12.9715987, 77.59456269999998);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MapProvider>(context);

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
              GestureDetector(
                onTap: () {
                  print("Clicked Search");
                  var result =showSearch(context: context, delegate: CustomSearch());
                  result.then((value) {
                    for (var i in value) {
                      clickedResult = i;
                    }
                    provider.moveToLocation(clickedResult.latLng);
                  });
                },
                child: AbsorbPointer(
                  child: TextField(
                    onTap: () {},
                    enabled: false,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor,
                        ),
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  color: Colors.grey,
                  height: MediaQuery.of(context).size.height - 240,
                  child: GoogleMap(
                    markers: provider.markers,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    onMapCreated: provider.onMapCreated,
                    initialCameraPosition: CameraPosition(target: _center),
                    onTap: (latLng) {
                      provider.moveToLocation(latLng);
                    },
                  )),
              SizedBox(
                height: 30,
              ),
              AccentButton(
                listener: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 24,
                              left: 24,
                              right: 24,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
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
