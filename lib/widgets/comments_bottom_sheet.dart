import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';
import 'package:instagram_clone_flutter_firebase/widgets/text.dart';

class CommentsBottomSheet extends StatefulWidget {
  const CommentsBottomSheet({super.key});

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  final TextEditingController commentController = TextEditingController();
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    commentController.addListener(() {
      setState(() {
        isTyping = commentController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: secondaryColor.shade900,
          ),
          child: Column(
            children: [
              const Divider(
                thickness: 2,
                indent: 180,
                endIndent: 180,
                color: secondaryColor,
              ),
              MyText(
                text: "Comments",
                textClr: primaryColor,
                textSize: 16,
                textWeight: FontWeight.bold,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 13,
                  itemBuilder:
                      (context, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              top: 6,
                              bottom: 6,
                              right: 12,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundImage: NetworkImage(
                                    "https://i.pinimg.com/236x/74/67/ac/7467acd73768ec753f20c4ac6cf39441.jpg",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Username    ",
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Aug 08, 2025",
                                              style: TextStyle(
                                                color: secondaryColor,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MyText(
                                        text: "Comment made by user",
                                        textClr: primaryColor,
                                        textSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: primaryColor,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          "https://i.pinimg.com/236x/74/67/ac/7467acd73768ec753f20c4ac6cf39441.jpg",
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: primaryColor, fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "Add a comment for postUsername ...",
                          hintStyle: TextStyle(
                            color: secondaryColor,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                        ),
                        controller: commentController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    isTyping
                        ? IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: blueColor),
                            ),
                          ),
                          color: primaryColor,
                          iconSize: 28,
                          tooltip: "Upload comment",
                          onPressed: () {},
                          icon: Icon(Icons.upload, color: primaryColor),
                        )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
