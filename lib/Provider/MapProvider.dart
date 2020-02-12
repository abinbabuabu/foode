

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' as LocationManager;

import 'Dataclass.dart';


const googleApiKey = "AIzaSyCI-g_7P0gWVOgzVbi1NA6YBXKOP0fAUuY";

class MapProvider with ChangeNotifier {
  final geolocator = Geolocator()..forceAndroidLocationManager;
  GoogleMapController _controller;
  LocationResult locationResult;

  bool isGps = false;

  LatLng _lastLocation;

  LatLng get lastLocation => _lastLocation;

  set lastLocation(LatLng value) {
    _lastLocation = value;
  }


  final Set<Marker> _markers = Set();

  Set<Marker> get markers => _markers;

  GoogleMapController get controller => _controller;

  void getLocationPermission() async {
    var location = LocationManager.Location();

    var permission = await location.requestPermission();
    if (permission) {
      print("location Checked ");
      var permission_geo = await geolocator.checkGeolocationPermissionStatus();
      if (permission_geo == GeolocationStatus.granted) {
        print("permission Granted");
        var Gps = await geolocator.isLocationServiceEnabled();
        if (Gps) {
          isGps = true;
          print("Gps Is ON");
          var position = await geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low);
          print("${position.latitude}${position.longitude}");
          print(position);
          lastLocation = LatLng(position.latitude,position.longitude);
          _addMarker(position);
          _cameraMoveMap(position);
        } else {
          isGps = false;
          print("Gps is OFF");
        }
      }
    }
  }

  void onMapCreated(GoogleMapController controller) {
    _controller = controller;
    if (_controller != null)
      getLocationPermission();
    else
      print("not Completed");
  }

  void _addMarker(Position position) {
    _markers.clear();
    _markers.add(Marker(
        markerId: MarkerId("Current_Location"),
        position: LatLng(position.latitude, position.longitude)));
    notifyListeners();
  }

  void _cameraMoveMap(Position position) {
    print("inside Camera move");
    if (_controller != null) {
      print("completer Checked ");
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 16)));
    }
  }

  void moveToLocation(LatLng latLng) {
    lastLocation = latLng;
    try {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: latLng,
            zoom: 15.0,
          ),
        ),
      );
    }catch(e){
      print(e);
    }
    setMarker(latLng);
  }

  void setMarker(LatLng latLng) {
    _markers.clear();
    _markers.add(
      Marker(
        markerId: MarkerId("selected-location"),
        position: latLng,
      ),
    );
    notifyListeners();
  }

  void reverseGeocodeLatLng(LatLng latLng) async{
    locationResult = LocationResult();
    var response = await http.get("https://maps.googleapis.com/maps/api/geocode/json?" +
        "latlng=${latLng.latitude},${latLng.longitude}&" +
        "key=$googleApiKey");

    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      final result = responseJson['results'][0];

      String road = result['address_components'][0]['short_name'];
      String locality = result['address_components'][1]['short_name'];
      locationResult.name = road;
      locationResult.locality = locality;
      locationResult.latlng = latLng.toString();
      locationResult.formattedAddress = result['formatted_address'];
      locationResult.placeId = result['place_id'];

      /*
      //Order Data
      orderData.name = road;
      orderData.locality = locality;
      orderData.lat = latLng.latitude.toString();
      orderData.lng = latLng.longitude.toString();
      orderData.formattedAddress = result['formatted_address'];
      orderData.placeId = result['place_id'];
       */

      print(locationResult.formattedAddress);
    }
  }
}
