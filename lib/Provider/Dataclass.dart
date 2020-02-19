import 'dart:core';

import 'package:flutter/material.dart';
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


class LunchData {
  String lunchPlannerId;
  String briefDesc;
  String displayName;
  String homeDesc;
  int priority;
  String chefImgUrl;
  String coverImgUrl;
  String dis1ImgUrl;
  String dis2ImgUrl;
  String dis3ImgUrl;
  int threeDayCost;
  int sevenDayCost;
  int thirtyDayCost;

  LunchData.fromSnap(Map<dynamic, dynamic> map){
    lunchPlannerId = map["lunchPlannerId"].toString();
    briefDesc = map["displayInfo"]["BriefDescription"].toString();
    displayName = map["displayInfo"]["DisplayName"].toString();
    homeDesc = map["displayInfo"]["HomeDescription"];
    priority = map["displayInfo"]["priority"];
    chefImgUrl = map["images"]["chefImg"];
    coverImgUrl = map["images"]["coverImg"];
    dis1ImgUrl = map["images"]["displayImg1"];
    dis2ImgUrl = map["images"]["displayImg2"];
    dis3ImgUrl = map["images"]["displayImg3"];

    sevenDayCost = map["price"]["sevendayCost"];
    threeDayCost = map["price"]["threedayCost"];
    thirtyDayCost = map["price"]["thirtydayCost"];
  }

}

class BreakFastData {
  String lunchPlannerId;
  String briefDesc;
  String displayName;
  String homeDesc;
  int priority;
  String chefImgUrl;
  String coverImgUrl;
  String dis1ImgUrl;
  String dis2ImgUrl;
  String dis3ImgUrl;
  int threeDayCost;
  int sevenDayCost;
  int thirtyDayCost;

  BreakFastData.fromSnap(Map<dynamic, dynamic> map){
    lunchPlannerId = map["breakfastPlannerId"].toString();
    briefDesc = map["displayInfo"]["BriefDescription"].toString();
    displayName = map["displayInfo"]["DisplayName"].toString();
    homeDesc = map["displayInfo"]["HomeDescription"];
    priority = map["displayInfo"]["priority"];
    chefImgUrl = map["images"]["chefImg"];
    coverImgUrl = map["images"]["coverImg"];
    dis1ImgUrl = map["images"]["displayImg1"];
    dis2ImgUrl = map["images"]["displayImg2"];
    dis3ImgUrl = map["images"]["displayImg3"];

    sevenDayCost = map["price"]["sevendayCost"];
    threeDayCost = map["price"]["threedayCost"];
    thirtyDayCost = map["price"]["thirtydayCost"];
  }
}


class AddressData {
  String locationName;
  String buildingName;
  String streetName;
  String landMark="";

  AddressData({@required this.locationName, @required this.buildingName,
    @required this.streetName, this.landMark});

}

class PaymentData {
  int amount;
  String desc;

  PaymentData({@required this.amount, @required this.desc,});
}
