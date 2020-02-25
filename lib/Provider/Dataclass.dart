import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class S {
  static String capitalize(String v) {
    return v.replaceAllMapped(RegExp(r'(?:^|(?:[.!?]\s))(\w{1})'),
        (Match m) => '${m.group(0).toUpperCase()}');
  }

  static String capitalizeW(String v) {
    return v.replaceAllMapped(RegExp(r'(^\w{1})|(\s{1}\w{1})'),
        (Match m) => '${m.group(0).toUpperCase()}');
  }

  static String dateToString(DateTime d) {
    return "${d.day}-${d.month}-${d.year}";
  }
}

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
  String homeName;

  MealData.fromSnapLunch(Map<dynamic, dynamic> map) {
    lunchPlannerId = map["lunchPlannerId"].toString();
    briefDesc = map["displayInfo"]["BriefDescription"].toString();
    displayName = map["displayInfo"]["DisplayName"].toString();
    homeName = map["displayInfo"]["Homename"].toString();
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
    lower();
    capitalise();
  }

  MealData.fromSnapBreak(Map<dynamic, dynamic> map) {
    breakfastPlannerId = map["breakfastPlannerId"].toString();
    briefDesc = map["displayInfo"]["BriefDescription"].toString();
    displayName = map["displayInfo"]["DisplayName"].toString();
    homeName = map["displayInfo"]["Homename"].toString();
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
    lower();
    capitalise();
  }

  MealData.fromSnapDinner(Map<dynamic, dynamic> map) {
    dinnerPlannerId = map["dinnerPlannerId"].toString();
    briefDesc = map["displayInfo"]["BriefDescription"].toString();
    displayName = map["displayInfo"]["DisplayName"].toString();
    homeName = map["displayInfo"]["Homename"].toString();
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
    lower();
    capitalise();
  }

  lower() {
    briefDesc = briefDesc.toLowerCase();
    displayName = displayName.toLowerCase();
    homeDesc = homeDesc.toLowerCase();
    homeName = homeName.toLowerCase();
  }

  capitalise() {
    briefDesc = S.capitalize(briefDesc);
    displayName = S.capitalize(displayName);
    homeName = S.capitalizeW(homeName);
    homeDesc = S.capitalize(homeDesc);
  }
}

class AddressData {
  String name;
  String locationName;
  String buildingName;
  String streetName;
  String landMark = "";
  String lat = "";
  String lng = "";
  String key;

  AddressData(
      {@required this.name,
      @required this.locationName,
      @required this.buildingName,
      @required this.streetName,
      this.landMark,
      this.key});

  AddressData.fromSnap(Map<dynamic, dynamic> map) {
    name = map["name"].toString().toLowerCase();
    locationName = map["locationName"].toString().toLowerCase();
    buildingName = map["buildingName"].toString().toLowerCase();
    streetName = map["streetName"].toString().toLowerCase();
    landMark = map["landMark"].toString().toLowerCase();
    key = map["key"].toString();
    capitalise();
  }

  capitalise() {
    name = S.capitalizeW(name);
    locationName = S.capitalizeW(locationName);
    buildingName = S.capitalizeW(buildingName);
    streetName = S.capitalizeW(streetName);
    landMark = S.capitalizeW(landMark);
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

class OrderData {
  String userId;
  String paymentId;
  String amountPaid;
  String address;
  String startDate;
  String days;
  String mealType;
  String weekEnds;
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

class PlannerData {
  String details;
  String img;
  DateTime date;
  String dates;
  String name;
  String key;
  String type;

  PlannerData.fromSnap(Map<dynamic, dynamic> map) {
    details = map["details"];
    img = map["img"];
    dates = map["key"];
    name = map["name"];
    key = map["pushKey"];
    type = map["type"];
    lower();
    capitalise();
    dateConvert();
  }

  lower() {
    name = name.toLowerCase();
    details = details.toLowerCase();
  }

  capitalise() {
    name = S.capitalize(name);
    details = S.capitalize(details);
  }

  dateConvert() {
    int day = int.parse(dates.substring(0, 2));
    int month = int.parse(dates.substring(3, 5));
    int year = int.parse(dates.substring(6, 10));
    date = DateTime(year, month, day);
  }
}

class SubscriptionData {
  String id = "";
  DateTime startDate;
  DateTime endDate;
  String date = "";
  int days;
  bool weekDays;

  SubscriptionData.fromSnap(Map<dynamic, dynamic> map) {
    id = map["subscriptionIds"].toString();
    date = map["startDate"];
    startDate = dateConvert(date);
    days = int.parse(map["days"].toString());
    weekDays = stringToBool(map["weekEnds"]);
    endDate = calculateEndDate(startDate, days, weekDays);
  }

  DateTime dateConvert(String dates) {
    int year = int.parse(dates.substring(0, 4));
    int month = int.parse(dates.substring(5, 7));
    int day = int.parse(dates.substring(8, 10));
    return DateTime(year, month, day);
  }

  DateTime calculateEndDate(DateTime start, int _days, bool weekend) {
    DateTime end = start;
    if (!weekend) {
      int count = 0;
      while (count <= _days) {
        end = end.add(Duration(days: 1));
        count++;
        if (end.weekday == DateTime.saturday) end = end.add(Duration(days: 1));
        if (start.weekday == DateTime.sunday) end = end.add(Duration(days: 1));
      }
      return end;
    } else {
      return start.add(Duration(days: _days-1));
    }
  }

  bool stringToBool(String s) {
    s = s.toLowerCase();
    if (s == "true")
      return true;
    else
      return false;
  }
}
