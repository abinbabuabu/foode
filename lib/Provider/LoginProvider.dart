import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

enum PhoneAuthState {
  Started,
  CodeSent,
  CodeResent,
  Verified,
  Failed,
  Error,
  AutoRetrievalTimeOut,
  newUser
}

class LoginProvider {
  static FirebaseAuth firebaseAuth;
  static var _authCredential, actualCode, phone, status;
  static StreamController<String> statusStream;
  static StreamController<PhoneAuthState> phoneAuthState;
  static Stream stateStream;

  static void AuthStateChanged(FirebaseUser user) {
    if (user == null) {
      addStatus("Not Logged In");
      addState(PhoneAuthState.Failed);
    } else {
      FirebaseDatabase.instance
          .reference()
          .child("Userss")
          .child(user.uid)
          .set(<String, String>{"uuid": user.uid, "phone": user.phoneNumber});
      if (user.metadata.lastSignInTime == user.metadata.creationTime) {
        addStatus("New User");
        addState(PhoneAuthState.newUser);
      } else {
        addStatus("Logging In ");
        addState(PhoneAuthState.Verified);
      }
    }
  }

  static instantiate() async {
    firebaseAuth = await FirebaseAuth.instance;
    firebaseAuth.onAuthStateChanged.listen(AuthStateChanged);
    statusStream = StreamController();
    phoneAuthState = StreamController(sync: true);
    stateStream = phoneAuthState.stream.asBroadcastStream();
  }

  static void startAuth({String phoneNumber}) {
    phone = phoneNumber;
    statusStream.stream
        .listen((String status) => debugPrint("PhoneAuth: " + status));

    firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  static final PhoneCodeSent codeSent =
      (String verificationId, [int forceResendingToken]) async {
    actualCode = verificationId;
    addStatus("\nEnter the code sent to " + phone);
    addState(PhoneAuthState.CodeSent);
  };

  static final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
      (String verificationId) {
    actualCode = verificationId;
    addStatus("\nAuto retrieval time out");
    addState(PhoneAuthState.AutoRetrievalTimeOut);
  };

  static final PhoneVerificationFailed verificationFailed =
      (AuthException authException) {
    addStatus('${authException.message}');
    addState(PhoneAuthState.Error);
    if (authException.message.contains('not authorized'))
      addStatus('App not authroized');
    else if (authException.message.contains('Network'))
      addStatus('Please check your internet connection and try again');
    else
      addStatus('Something has gone wrong, please try later ' +
          authException.message);
  };

  static final PhoneVerificationCompleted verificationCompleted =
      (AuthCredential auth) {
    addStatus('Auto retrieving verification code');

    firebaseAuth.signInWithCredential(auth).then((AuthResult value) {
      if (value.user != null) {
        addStatus(status = 'Authentication successful');
        //remove this to add new user check and add onAuthChange
        addState(PhoneAuthState.Verified);
      } else {
        addState(PhoneAuthState.Failed);
        addStatus('Invalid code/invalid authentication');
      }
    }).catchError((error) {
      addState(PhoneAuthState.Error);
      addStatus('Something has gone wrong, please try later $error');
    });
  };

  static void signInWithPhoneNumber(String smsCode) async {
    _authCredential = PhoneAuthProvider.getCredential(
        verificationId: actualCode, smsCode: smsCode);

    firebaseAuth.signInWithCredential(_authCredential).then((user) async {
      addStatus('Authentication successful');
      addState(PhoneAuthState.Verified);
      // onAuthenticationSuccessful();
    }).catchError((error) {
      addState(PhoneAuthState.Error);
      addStatus(
          'Something has gone wrong, please try later(signInWithPhoneNumber) $error');
    });
  }

  static void onAuthenticationSuccessful() {
    firebaseAuth = null;
    if (stateStream != null) statusStream.close();
    if (phoneAuthState != null) phoneAuthState.close();

    print("Called close");
  }

  static addState(PhoneAuthState state) {
    phoneAuthState.sink.add(state);
  }

  static void addStatus(String s) {
    statusStream.sink.add(s);
  }

  static logOut() {
    FirebaseAuth.instance.signOut();
    firebaseAuth = null;
  }
}
