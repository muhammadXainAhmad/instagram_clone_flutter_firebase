import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone_flutter_firebase/methods/storage_methods.dart';
import 'package:instagram_clone_flutter_firebase/models/posts.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String caption,
    Uint8List file,
    String uid,
    String username,
    String profileUrl,
  ) async {
    String message = "";
    try {
      String postUrl = await StorageMethods().uploadImageToStorage(
        "posts",
        file,
        true,
      );
      String postId = Uuid().v1();
      Post post = Post(
        postId: postId,
        postUrl: postUrl,
        postedDate: DateTime.now(),
        caption: caption,
        likes: [],
        uid: uid,
        username: username,
        profileUrl: profileUrl,
      );
      _firestore.collection("posts").doc(postId).set(post.toMap());
      message = "Post Successfully Added!";
    } catch (err) {
      message = err.toString();
    }
    return message;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection("posts").doc(postId).update({
          "likes": FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore.collection("posts").doc(postId).update({
          "likes": FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
