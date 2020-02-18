import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPage extends StatefulWidget {
  final PaymentData paymentData;

  RazorpayPage({@required this.paymentData});

  @override
  _RazorpayPageState createState() => _RazorpayPageState();
}

class _RazorpayPageState extends State<RazorpayPage> {
  var _razorpay;
  var options;
  @override
  void initState() {
    super.initState();

     _razorpay= Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    options = {
      'key': 'rzp_test_CSw4pt9C3vLihg',
      'amount': widget.paymentData.amount*100, //in the smallest currency sub-unit.
      'name': 'Foode',
      'description': widget.paymentData.desc,
      'prefill': {'contact': "96", 'email': ''}
    };
    print("payment Called");

  }

  @override
  Widget build(BuildContext context) {
    try{_razorpay.open(options);}catch(e){
      debugPrint(e);
    }


    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container()
        ),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(response.orderId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print(response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print(response.walletName);
  }
}
