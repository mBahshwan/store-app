import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/view/homeScreen.dart';
import 'package:ecommerce_app/view/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  String? email, password, userName;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Future SignUp() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: "$email", password: "$password");
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak password') {
          print("weak password");
        } else if (e.code == "email-already-in-use") {
          print("email is already exist");
        }
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Form(
        key: formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (val) {
                  if (val!.length < 4) {
                    return " email is too short";
                  }
                },
                onChanged: ((value) {
                  email = value;
                }),
                decoration: InputDecoration(
                    hintText: "Enter your email",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (val) {
                  if (val!.length < 4) {
                    return " password is too short";
                  }
                },
                onChanged: ((value) {
                  password = value;
                }),
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (val) {
                  if (val!.length < 4) {
                    return " username is too short";
                  }
                },
                onChanged: ((value) {
                  userName = value;
                }),
                decoration: InputDecoration(
                    hintText: "Enter your username",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("if you have account "),
                InkWell(
                  child:
                      Text("click here", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                        (route) => false);
                  },
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () async {
                var user = await SignUp();
                if (user != null) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                      (route) => false);
                }
              },
              child: Text("Sign Up"),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
