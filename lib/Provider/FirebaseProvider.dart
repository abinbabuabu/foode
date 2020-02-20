import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:foodie/Provider/Dataclass.dart';
import 'dart:convert';


/*

!!!Selected !!

0 -> BreakFast
1 -> Lunch
2 -> Dinner

 */

class FirebaseProvider extends ChangeNotifier {
  DatabaseReference _firebase;
  AddressData tempAddress;
  bool isAddressAdded;
  FirebaseUser _user;
  List<AddressData> addressList;

  LunchData selectedLunch;
  DinnerData selectedDinner;
  BreakFastData selectedBreakFast;

  int selected;

  FirebaseProvider.instantiate() {
    _firebase = FirebaseDatabase.instance.reference();
  }

  Future<List<LunchData>> retrieveLunch() async {
    List<LunchData> lunchList = List();
    var data = await _firebase.child("lunch").once().catchError((error) {});
    Map<dynamic, dynamic> _resultMap = data.value;

    _resultMap.forEach((key, value) {
      LunchData lunchData = LunchData.fromSnap(value);
      lunchList.add(lunchData);
    });
    return lunchList;
  }

  Future<List<BreakFastData>> retrieveBreakFast() async {
    List<BreakFastData> breakFastList = List();
    var data = await _firebase.child("breakfast").once().catchError((error) {});
    Map<dynamic, dynamic> _resultMap = data.value;

    _resultMap.forEach((key, value) {
      BreakFastData breakFastData = BreakFastData.fromSnap(value);
      breakFastList.add(breakFastData);
    });
    return breakFastList;
  }

  Future<List<LunchData>> retrieveDinner() async {
    List<LunchData> lunchList = List();
    var data = await _firebase.child("dinner").once().catchError((error) {});
    Map<dynamic, dynamic> _resultMap = data.value;

    _resultMap.forEach((key, value) {
      LunchData lunchData = LunchData.fromSnap(value);
      lunchList.add(lunchData);
    });
    return lunchList;
  }

  Future<bool> addAddress(AddressData addressData) async {
    _user = await FirebaseAuth.instance.currentUser();
    bool result = await _firebase
        .child("AppData")
        .child(_user.uid)
        .child("Address")
        .push()
        .set(<String, String>{
      "locationName": addressData.locationName,
      "buildingName": addressData.buildingName,
      "streetName": addressData.streetName,
      "landMark": addressData.landMark
    }).then((val) {
      return true;
    }).catchError((e) {
      return false;
    });
    return result;
  }

  Future<void> getAddresses() async {
    addressList = List();
    _user = await FirebaseAuth.instance.currentUser();
    var data = await _firebase
        .child("AppData")
        .child(_user.uid)
        .child("Address")
        .once()
        .catchError((error) {});
    Map<dynamic, dynamic> _resultMap = data.value;
    _resultMap.forEach((key, value) {
      AddressData addressData = AddressData.fromSnap(value);
      addressList.add(addressData);
    });
  }

  void postOrder(OrderData orderData) async {
    var url = "https://us-central1-chefconnet.cloudfunctions.net/orders";
    var headers = {'Content-Type': 'application/json'};
    var mjson = json.encode(orderData);
    print(mjson);
    var response = await http.post(url, body: mjson, headers: headers);
    print(response.statusCode);
  }
}
