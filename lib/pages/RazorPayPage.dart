import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Provider/Dataclass.dart';
import 'package:foodie/Provider/FirebaseProvider.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPage extends StatefulWidget {
  final OrderData orderData;

  RazorpayPage({@required this.orderData});

  @override
  _RazorpayPageState createState() => _RazorpayPageState();
}

class _RazorpayPageState extends State<RazorpayPage> {
  var _razorpay;
  var options;
  FirebaseProvider provider;

  Widget _show = Container();

  String _text = "";

  @override
  void initState() {
    super.initState();

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    options = {
      'key': 'rzp_test_CSw4pt9C3vLihg',
      'amount': widget.orderData.amountPaid * 100,
      //in the smallest currency sub-unit.
      'name': 'Foode',
      'description': widget.orderData.desc,
      'prefill': {'contact': widget.orderData.phone, 'email': ''}
    };
    print("payment Called");
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FirebaseProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 4,
              right: 4,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 180,
                  width: 180,
                  child: _show,
                ),
                Text(_text)
              ],
            )),
          ],
        ),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    widget.orderData.paymentId = response.paymentId;
    provider.postOrder(widget.orderData);
    _show = Image.asset("assets/img/pays.png");
    _text = "Payment Success";
    setState(() {
      _show;
      _text;
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print(response.message);
    _show = Image.asset("assets/img/paye.png");
    _text = "Payment Failed ! Try Again";
    setState(() {
      _show;
      _text;
    });
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print(response.walletName);
  }
}
