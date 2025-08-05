import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone_flutter_firebase/methods/storage_methods.dart';
import 'package:instagram_clone_flutter_firebase/models/users.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return UserModel.fromSnap(snap);
  }

  //LOG IN USING EMAIL AND PASSWORD
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String message = "";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        message = "User Logged In Successfully!";
      } else {
        message = "Please enter all the fields.";
      }
    } on FirebaseAuthException catch (err) {
      switch (err.code) {
        case "invalid-email":
          message = "The email format is invalid.";
          break;
        case 'user-not-found':
          message = 'No user found for this email.';
          break;
        case 'invalid-credential':
          message = 'Incorrect password.';
          break;
        default:
          message = "An error occured. Please try again.";
      }
    }
    return message;
  }

  //SIGN UP USING EMAIL AND PASSWORD
  Future<String> signupWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String message = "";
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        // CREATING USER
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods().uploadImageToStorage(
          "profilePics",
          file,
          false,
        );

        UserModel user = UserModel(
          uid: userCred.user!.uid,
          username: username,
          email: email,
          bio: bio,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );

        // ADDING USER DATA TO FIRESTORE
        _firestore
            .collection("users")
            .doc(userCred.user!.uid)
            .set(user.toMap());
        message = "User Created Successfully!";
      }
    } on FirebaseAuthException catch (err) {
      switch (err.code) {
        case "invalid-email":
          message = "The email format is invalid.";
          break;
        case "weak-password":
          message = "Password is too weak.";
          break;
        default:
          message = "An error occured. Please try again.";
      }
    }
    return message;
  }
}
