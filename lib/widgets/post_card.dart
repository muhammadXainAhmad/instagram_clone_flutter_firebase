import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter_firebase/methods/firestore_methods.dart';
import 'package:instagram_clone_flutter_firebase/providers/user_provider.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';
import 'package:instagram_clone_flutter_firebase/widgets/like_animation.dart';
import 'package:instagram_clone_flutter_firebase/widgets/text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({super.key, required this.snap});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getUser;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(widget.snap["photoUrl"]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: MyText(
                  text: widget.snap["username"],
                  textClr: primaryColor,
                  textSize: 16,
                  textWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          GestureDetector(
            onDoubleTap: () async {
              await FirestoreMethods().likePost(
                widget.snap["postId"],
                user!.uid,
                widget.snap["likes"],
              );
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Image.network(
                    fit: BoxFit.cover,
                    widget.snap["postUrl"],
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: isLikeAnimating,
                    duration: const Duration(milliseconds: 400),
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                      });
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: primaryColor,
                      size: 150,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await FirestoreMethods().likePost(
                    widget.snap["postId"],
                    user.uid,
                    widget.snap["likes"],
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 3),
                  child: LikeAnimation(
                    isAnimating: widget.snap["likes"].contains(user!.uid),
                    smallLike: true,
                    child:
                        widget.snap["likes"].contains(user.uid)
                            ? Icon(Icons.favorite, color: errorColor, size: 28)
                            : Icon(Icons.favorite_border, color: primaryColor),
                  ),
                ),
              ),
              MyText(
                text: "${widget.snap["likes"].length}",
                textClr: primaryColor,
                textSize: 12,
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 3),
                  child: Icon(
                    Icons.messenger_outline,
                    color: primaryColor,
                    size: 28,
                  ),
                ),
              ),
              MyText(text: "18", textClr: primaryColor, textSize: 12),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 4),
                  child: Icon(Icons.send, color: primaryColor, size: 28),
                ),
              ),
              MyText(text: "32", textClr: primaryColor, textSize: 12),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_border,
                  color: primaryColor,
                  size: 28,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 5),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.snap["username"],
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: "  ${widget.snap["caption"]}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: MyText(
                text: DateFormat.yMMMd().format(
                  widget.snap["postedDate"].toDate(),
                ),
                textClr: secondaryColor,
                textSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
