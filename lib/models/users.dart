import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String? uid;
  String? email;
  String? password;

  Users({this.email, this.password, this.uid});

  factory Users.fromFirebase(DocumentSnapshot data) {
    return Users(
        uid: (data.data() as dynamic)['uid'],
        email: (data.data() as dynamic)['email'],
        password: (data.data() as dynamic)['password']);
  }

  Map<String, dynamic> toFirebase() =>
      {"uid": uid, "email": email, "password": password};
}
