import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';
import 'package:instagram_clone_flutter_firebase/utils/utils.dart';
import 'package:instagram_clone_flutter_firebase/widgets/elevated_button.dart';
import 'package:instagram_clone_flutter_firebase/widgets/text.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;

  const ProfileScreen({super.key, required this.uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData = {};
  int postLength = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var postSnap =
          await FirebaseFirestore.instance
              .collection("posts")
              .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .get();

      postLength = postSnap.docs.length;
      var userSnap =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(widget.uid)
              .get();
      userData = userSnap.data()!;
      followers = userSnap.data()!["followers"].length;
      following = userSnap.data()!["followers"].length;
      isFollowing = userSnap.data()!["followers"].contains(
        FirebaseAuth.instance.currentUser!.uid,
      );
      setState(() {});
    } catch (err) {
      if (mounted) {
        showSnackBar(context: context, content: err.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.menu, color: primaryColor),
          ),
        ],
        title: MyText(
          text: userData["username"],
          textClr: primaryColor,
          textSize: 22,
          textWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: secondaryColor, width: 1),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(userData["photoUrl"]),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: MyText(
                              text: userData["username"],
                              textClr: primaryColor,
                              textSize: 15,
                              textWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              statColumn(postLength, "posts"),
                              statColumn(followers, "followers"),
                              statColumn(following, "following"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: MyText(
                  text: userData["bio"],
                  textClr: primaryColor,
                  textSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child:
                        FirebaseAuth.instance.currentUser!.uid == widget.uid
                            ? MyElevatedButton(
                              buttonText: "Edit profile",
                              onPressed: () {},
                              bgClr: secondaryColor.shade700,
                              radius: 5,
                              height: 35,
                              fontSize: 14,
                            )
                            : isFollowing
                            ? MyElevatedButton(
                              buttonText: "Unfollow",
                              onPressed: () {},
                              textClr: Colors.black,
                              bgClr: primaryColor,
                              radius: 5,
                              height: 35,
                              fontSize: 14,
                            )
                            : MyElevatedButton(
                              buttonText: "Follow",
                              onPressed: () {},
                              textClr: primaryColor,
                              bgClr: blueColor,
                              radius: 5,
                              height: 35,
                              fontSize: 14,
                            ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child:
                        FirebaseAuth.instance.currentUser!.uid == widget.uid
                            ? MyElevatedButton(
                              buttonText: "Share profile",
                              onPressed: () {},
                              bgClr: secondaryColor.shade700,
                              radius: 5,
                              height: 35,
                              fontSize: 14,
                            )
                            : MyElevatedButton(
                              buttonText: "Message",
                              onPressed: () {},
                              bgClr: secondaryColor.shade700,
                              radius: 5,
                              height: 35,
                              fontSize: 14,
                            ),
                  ),
                ],
              ),
              // Expanded(
              //   child: MasonryGridView.builder(
              //     mainAxisSpacing: 8,
              //     crossAxisSpacing: 8,
              //     gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //     ),
              //     itemCount: 6,
              //     itemBuilder:
              //         (context, index) => Image.network(
              //           "https://img.freepik.com/free-photo/fuji-mountain-kawaguchiko-lake-morning-autumn-seasons-fuji-mountain-yamanachi-japan_335224-102.jpg?semt=ais_hybrid&w=740&q=80",
              //           fit: BoxFit.cover,
              //         ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Column statColumn(int num, String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyText(
        text: num.toString(),
        textClr: primaryColor,
        textSize: 14,
        textWeight: FontWeight.bold,
      ),
      MyText(
        text: label,
        textClr: primaryColor,
        textSize: 14,
        textWeight: FontWeight.bold,
      ),
    ],
  );
}
