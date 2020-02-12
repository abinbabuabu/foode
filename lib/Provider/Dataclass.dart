import 'package:google_maps_flutter/google_maps_flutter.dart';

class PredictionResult {
  String id;
  String name;
  LatLng latLng;
  bool iconVisibility = true;
}

class SearchResult {
  String desc;
  String log;
  String lat;

  SearchResult(this.desc, this.log, this.lat);
}
class LocationResult {
  String name;
  String locality;
  String latlng;
  String formattedAddress;
  String placeId;
}