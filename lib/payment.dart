import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  final String name, description;
  final int price;
  Payment({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay? _razorpay;
  String? customername, phoneNumer, address;
  String email = FirebaseAuth.instance.currentUser!.email.toString();

  @override
  void initState() {
    super.initState();
    print("${widget.price}");
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_pXyq9VRYUtoTil',
      'amount': widget.price * 100,
      'name': customername,
      'description': widget.description,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '$phoneNumer', 'email': '$email'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay!.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("SUCCESS: " + response.paymentId!)));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "ERROR: " + response.code.toString() + " - " + response.message!)));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("EXTERNAL_WALLET: " + response.walletName!)));
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(backgroundColor: kPrimaryColor),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Card(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                TextField(
                  onChanged: (val) {
                    phoneNumer = val;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your nobile number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  onChanged: (val) {
                    address = val;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your adress",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  onChanged: (val) {
                    customername = val;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            )),
            MaterialButton(
                textColor: kPrimaryColor,
                color: Colors.white,
                onPressed: () {
                  openCheckout();
                },
                child: Text("pay now"))
          ],
        )),
      ),
    );
  }
}
