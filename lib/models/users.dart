import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const UserModel({
    required this.uid,
    required this.email,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,
    "username": username,
    "bio": bio,
    "followers": followers,
    "following": following,
  };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      username: snapshot["username"],
      bio: snapshot["bio"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }
}
