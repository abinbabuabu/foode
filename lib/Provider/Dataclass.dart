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

class MealData {
  String lunchPlannerId = "";
  String breakfastPlannerId = "";
  String dinnerPlannerId = "";
  int selected;
  String briefDesc;
  String displayName;
  String homeDesc;
  int priority;
  String chefId;
  String chefImgUrl;
  String coverImgUrl;
  String dis1ImgUrl;
  String dis2ImgUrl;
  String dis3ImgUrl;
  int threeDayCost;
  int sevenDayCost;
  int thirtyDayCost;

  MealData.fromSnapLunch(Map<dynamic, dynamic> map) {
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
    chefId = map["chefId"].toString();
    sevenDayCost = map["price"]["sevendayCost"];
    threeDayCost = map["price"]["threedayCost"];
    thirtyDayCost = map["price"]["thirtydayCost"];
    selected = 1;
  }

  MealData.fromSnapBreak(Map<dynamic, dynamic> map) {
    breakfastPlannerId = map["breakfastPlannerId"].toString();
    briefDesc = map["displayInfo"]["BriefDescription"].toString();
    displayName = map["displayInfo"]["DisplayName"].toString();
    homeDesc = map["displayInfo"]["HomeDescription"];
    priority = map["displayInfo"]["priority"];
    chefImgUrl = map["images"]["chefImg"];
    coverImgUrl = map["images"]["coverImg"];
    dis1ImgUrl = map["images"]["displayImg1"];
    dis2ImgUrl = map["images"]["displayImg2"];
    dis3ImgUrl = map["images"]["displayImg3"];
    chefId = map["chefId"].toString();
    sevenDayCost = map["price"]["sevendayCost"];
    threeDayCost = map["price"]["threedayCost"];
    thirtyDayCost = map["price"]["thirtydayCost"];
    selected = 0;
  }

  MealData.fromSnapDinner(Map<dynamic, dynamic> map) {
    dinnerPlannerId = map["dinnerPlannerId"].toString();
    briefDesc = map["displayInfo"]["BriefDescription"].toString();
    displayName = map["displayInfo"]["DisplayName"].toString();
    homeDesc = map["displayInfo"]["HomeDescription"];
    priority = map["displayInfo"]["priority"];
    chefImgUrl = map["images"]["chefImg"];
    coverImgUrl = map["images"]["coverImg"];
    dis1ImgUrl = map["images"]["displayImg1"];
    dis2ImgUrl = map["images"]["displayImg2"];
    dis3ImgUrl = map["images"]["displayImg3"];
    chefId = map["chefId"].toString();
    sevenDayCost = map["price"]["sevendayCost"];
    threeDayCost = map["price"]["threedayCost"];
    thirtyDayCost = map["price"]["thirtydayCost"];
    selected = 2;
  }
}

class AddressData {
  String locationName;
  String buildingName;
  String streetName;
  String landMark = "";

  AddressData(
      {@required this.locationName,
      @required this.buildingName,
      @required this.streetName,
      this.landMark});

  AddressData.fromSnap(Map<dynamic, dynamic> map) {
    locationName = map["locationName"];
    buildingName = map["buildingName"];
    streetName = map["streetName"];
    landMark = map["landMark"];
  }
}

class PaymentData {
  int amount;
  String desc;

  PaymentData({
    @required this.amount,
    @required this.desc,
  });
}

/*
userid
payid
amount
address
startdate
days
weekend
chefid
mealType
*/
//{
//"userId":"Paul Arasu",
//"chefId":"Something",
//"paymentId":"hello",
//"amountPaid":240,
//"address":"hello",
//"startDate":"12-12-12",
//"mealType":"lunch",
//"days":"2",
//"weekEnds":"True"
//}

class OrderData {
  String userId;
  String paymentId;
  String amountPaid;
  String address;
  String startDate;
  String days;
  String mealType;
  bool weekEnds;
  String chefId;

  OrderData.make(
      {@required this.amountPaid,
      @required this.userId,
      @required this.paymentId,
      @required this.address,
      @required this.startDate,
      @required this.days,
      @required this.mealType,
      @required this.chefId,
      @required this.weekEnds});

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'paymentId': paymentId,
        'amountPaid': amountPaid,
        'address': address,
        'startDate': startDate,
        'days': days,
        'mealType': mealType,
        'weekEnds': weekEnds,
        'chefId': chefId
      };
}
