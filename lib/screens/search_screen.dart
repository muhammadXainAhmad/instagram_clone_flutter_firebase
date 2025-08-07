import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          style: TextStyle(color: primaryColor),
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search for a user",
            hintStyle: TextStyle(color: primaryColor),
          ),
          onFieldSubmitted: (value) {
            setState(() {
              isShowUsers = true;
            });
          },
        ),
      ),
      body:
          isShowUsers
              ? FutureBuilder(
                future:
                    FirebaseFirestore.instance
                        .collection("users")
                        .where(
                          "username",
                          isGreaterThanOrEqualTo: searchController.text.trim(),
                        )
                        .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: (snapshot.data! as dynamic).docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              (snapshot.data! as dynamic)
                                  .docs[index]["photoUrl"],
                            ),
                          ),
                          title: Text(
                            (snapshot.data! as dynamic).docs[index]["username"],
                          ),
                        );
                      },
                    );
                  }
                },
              )
              : FutureBuilder(
                future: FirebaseFirestore.instance.collection("posts").get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return MasonryGridView.builder(
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder:
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.network(
                            (snapshot.data! as dynamic).docs[index]["postUrl"],
                          ),
                        ),
                  );
                },
              ),
    );
  }
}
