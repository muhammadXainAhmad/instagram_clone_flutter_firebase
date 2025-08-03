import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone_flutter_firebase/methods/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //SIGN UP USING EMAIL AND PASSWORD
  Future<String> signupWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Error Occured!";
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        // CREATING USER
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoURL = await StorageMethods().uploadImageToStorage(
          "profilePics",
          file,
          false,
        );

        // ADDING USER DATA TO FIRESTORE
        _firestore.collection("users").doc(userCred.user!.uid).set({
          "uid": userCred.user!.uid,
          "username": username,
          "email": email,
          "bio": bio,
          "photoURL": photoURL,
          "followers": [],
          "following": [],
        });
        res = "User Created Successfully!";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
