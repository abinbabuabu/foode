import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';

class FirebaseProvider extends ChangeNotifier {
  DatabaseReference _firebase;
  FirebaseUser _user;

  FirebaseProvider.instantiate() {
    _firebase = FirebaseDatabase.instance.reference();
    _getUser();
  }

  _getUser() async {
    _user = await FirebaseAuth.instance.currentUser();
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

  Future<List<LunchData>> retrieveBreakFast() async {
    List<LunchData> lunchList = List();
    var data = await _firebase.child("breakfast").once().catchError((error) {});
    Map<dynamic, dynamic> _resultMap = data.value;

    _resultMap.forEach((key, value) {
      LunchData lunchData = LunchData.fromSnap(value);
      lunchList.add(lunchData);
    });
    return lunchList;
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
    bool result = await _firebase
        .child("AppData")
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
}
