import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';
import 'package:instagram_clone_flutter_firebase/widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          "assets/instagramLogo.svg",
          color: primaryColor,
          height: 32,
          width: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message, color: primaryColor),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("posts").snapshots(),
        builder: (
          context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshots,
        ) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshots.data!.docs.length,
            itemBuilder:
                (context, index) => PostCard(snap: snapshots.data!.docs[index].data()),
          );
        },
      ),
    );
  }
}
