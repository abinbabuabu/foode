import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier{
  DatabaseReference _firebase;
  FirebaseProvider.instantiate(){
    _firebase = FirebaseDatabase.instance.reference();
  }

  void retrieveLunch(){

  }

}