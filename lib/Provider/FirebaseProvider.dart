import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:foodie/Provider/Dataclass.dart';
import 'dart:convert';

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
    var user = await FirebaseAuth.instance.currentUser();
    return user;
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
    bool result = await _firebase
        .child("AppData")
        .child(_user.uid)
        .child("Address")
        .push()
        .set(<String, String>{
      "name": addressData.name,
      "locationName": addressData.locationName,
      "buildingName": addressData.buildingName,
      "streetName": addressData.streetName,
      "landMark": addressData.landMark,
      "lat":addressData.lat,
      "lng":addressData.lng
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
        .child(_user.uid)
        .child("Address")
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
    plannerList.sort((a,b) => a.date.compareTo(b.date));
    return plannerList;
  }
}
