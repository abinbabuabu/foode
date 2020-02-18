import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';

class FirebaseProvider extends ChangeNotifier {
  DatabaseReference _firebase;

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
}
