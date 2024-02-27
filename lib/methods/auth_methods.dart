import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> login({
    required String email,
    required String password,
  }) {
    if (email.isNotEmpty && password.isNotEmpty) {
      _auth.signInWithEmailAndPassword(email: email, password: password);
      return Future<String>.value("Success");
    }
    return Future<String>.value("Please fill all the fields");
  }

  Future<String> signUp({
    required String email,
    required String password,
    required String username,
    Uint8List? file,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      Users user = Users(
        uid: userCredential.user!.uid,
        email: email,
        bio: "",
        photoUrl: "",
        followers: [],
        following: [],
        posts: [],
        saved: [],
        searchKey: username,
      );
      await _firestore.collection("users").doc(user.uid).set(user.toJson());
      return Future<String>.value("Success");
    }
    return Future<String>.value("Please fill all the fields");
  }
}
