import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:http/http.dart' as http;

class FirebaseProvider extends ChangeNotifier {
  DatabaseReference _firebase;
  AddressData tempAddress;
  bool isAddressAdded;
  FirebaseUser _user;
  String _locationName;

  String get locationName => _locationName;

  List<AddressData> addressList;

  FirebaseProvider.instantiate() {
    _firebase = FirebaseDatabase.instance.reference();
  }

  Future<FirebaseUser> getUuid() async {
    return await FirebaseAuth.instance.currentUser();
  }

  Future<List<MealData>> retrieveLunch() async {
    List<MealData> lunchList = List();
    var data = await _firebase.child("lunch").once().catchError((error) {});
    Map<dynamic, dynamic> _resultMap = data.value;

    _resultMap.forEach((key, value) {
      MealData lunchData = MealData.fromSnapLunch(value);
      lunchList.add(lunchData);
    });
    return lunchList;
  }

  Future<List<MealData>> retrieveBreakFast() async {
    List<MealData> breakFastList = List();
    var data = await _firebase.child("breakfast").once().catchError((error) {});
    Map<dynamic, dynamic> _resultMap = data.value;

    _resultMap.forEach((key, value) {
      MealData breakFastData = MealData.fromSnapBreak(value);
      breakFastList.add(breakFastData);
    });
    return breakFastList;
  }

  Future<List<MealData>> retrieveDinner() async {
    List<MealData> lunchList = List();
    var data = await _firebase.child("dinner").once().catchError((error) {});
    Map<dynamic, dynamic> _resultMap = data.value;

    _resultMap.forEach((key, value) {
      MealData dinnerData = MealData.fromSnapDinner(value);
      lunchList.add(dinnerData);
    });
    return lunchList;
  }

  Future<bool> addAddress(AddressData addressData) async {
    _user = await FirebaseAuth.instance.currentUser();
    var key =
        _firebase.child("AppData").child("Address").child(_user.uid).push().key;
    bool result = await _firebase
        .child("AppData")
        .child("Address")
        .child(_user.uid)
        .child(key)
        .set(<String, String>{
      "name": addressData.name,
      "locationName": addressData.locationName,
      "buildingName": addressData.buildingName,
      "streetName": addressData.streetName,
      "landMark": addressData.landMark,
      "lat": addressData.lat,
      "lng": addressData.lng,
      "key": key
    }).then((val) {
      return true;
    }).catchError((e) {
      return false;
    });
    return result;
  }

  Future<List<AddressData>> getAddresses() async {
    addressList = List();
    _user = await FirebaseAuth.instance.currentUser();
    var data = await _firebase
        .child("AppData")
        .child("Address")
        .child(_user.uid)
        .once()
        .catchError((error) {});
    Map<dynamic, dynamic> _resultMap = data.value;
    _resultMap.forEach((key, value) {
      AddressData addressData = AddressData.fromSnap(value);
      addressList.add(addressData);
    });
    return addressList;
  }

  void postOrder(OrderData orderData) async {
    var url = "https://us-central1-chefconnet.cloudfunctions.net/orders";
    var headers = {'Content-Type': 'application/json'};
    var mjson = json.encode(orderData);
    print(mjson);
    var response = await http.post(url, body: mjson, headers: headers);
    print(response.body);
  }

  Future<List<PlannerData>> getPlannerDetails(String plannerId) async {
    List<PlannerData> plannerList = List();
    var data = await _firebase
        .child("plannerId")
        .child(plannerId)
        .once()
        .catchError((error) {});
    Map<dynamic, dynamic> _resultMap = data.value;
    _resultMap.forEach((key, value) {
      PlannerData plannerData = PlannerData.fromSnap(value);
      plannerList.add(plannerData);
    });
    plannerList.sort((a, b) => a.date.compareTo(b.date));
    return plannerList;
  }

  Future<void> deleteAddress(String id) async {
    var userId = await getUuid();
    return _firebase
        .child("AppData")
        .child("Address")
        .child(userId.uid)
        .child(id)
        .remove();
  }

  Future<List<SubscriptionData>> getSubscription() async {
    List<SubscriptionData> _list = List();
    print("Subscription Clae");
    _user = await FirebaseAuth.instance.currentUser();
    var data = await _firebase
        .child("AppData")
        .child("subscriptions")
        .child(_user.uid)
        .once()
        .catchError((error) {
          print(error);
    });
    Map<dynamic, dynamic> _resultMap = data.value;
    _resultMap.forEach((key, value) {
      SubscriptionData _subscriptionData = SubscriptionData.fromSnap(value);
      print(_subscriptionData.startDate);
      print(_subscriptionData.endDate);
      _list.add(_subscriptionData);
    });
     _list.sort((a,b)=> a.id.compareTo(b.id));
     return _list;
  }
}
