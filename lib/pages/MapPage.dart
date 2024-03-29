import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:foodie/Provider/FirebaseProvider.dart';
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
  LatLng _current = _center;
  double _height;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _height = _height - (_height / 2.3);
    var provider = Provider.of<MapProvider>(context);
    var dbProvider = Provider.of<FirebaseProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
        elevation: 0,
      ),
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
                  var result =
                      showSearch(context: context, delegate: CustomSearch(),);
                  result.then((value) {
                    for (var i in value) {
                      clickedResult = i;
                    }
                    provider.moveToLocation(clickedResult.latLng);
                    _current = clickedResult.latLng;
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
                  height: _height,
                  child: GoogleMap(
                    markers: provider.markers,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    mapToolbarEnabled: false,
                    onMapCreated: provider.onMapCreated,
                    initialCameraPosition: CameraPosition(target: _center),
                    onTap: (latLng) {
                      provider.moveToLocation(latLng);
                      _current = latLng;
                    },
                  )),
              SizedBox(
                height: 30,
              ),
              AccentButton(
                listener: () {
                  var result = showModalBottomSheet(
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
                  result.then((value) {
                    if (value == true && dbProvider.isAddressAdded == true) {
                      dbProvider.tempAddress.lat = _current.latitude.toString();
                      dbProvider.tempAddress.lng =
                          _current.longitude.toString();
                      dbProvider.addAddress(dbProvider.tempAddress).then((val) {
                        if (val) {
                          print("address Added");
                          SnackBar snack = SnackBar(
                            content: Text("Address Added Successfully ✔️"),
                          );
                          _scaffoldKey.currentState.showSnackBar(snack);
                        } else {
                          SnackBar snack = SnackBar(
                            content: Text("Failed Adding address"),
                          );
                          _scaffoldKey.currentState.showSnackBar(snack);
                        }
                      });
                    }
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
