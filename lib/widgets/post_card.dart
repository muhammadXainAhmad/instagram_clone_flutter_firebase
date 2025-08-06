import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';
import 'package:instagram_clone_flutter_firebase/widgets/text.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  final snap;
  const PostCard({super.key, required this.snap});
  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: NetworkImage(snap["photoUrl"]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: MyText(
                  text: snap["username"],
                  textClr: primaryColor,
                  textSize: 16,
                  textWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.network(fit: BoxFit.cover, snap["postUrl"]),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 3),
                  child: Icon(Icons.favorite_border),
                ),
              ),
              MyText(
                text: "${snap["likes"].length}",
                textClr: primaryColor,
                textSize: 12,
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 3),
                  child: Icon(Icons.messenger_outline),
                ),
              ),
              MyText(text: "18", textClr: primaryColor, textSize: 12),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 4),
                  child: Icon(Icons.send),
                ),
              ),
              MyText(text: "32", textClr: primaryColor, textSize: 12),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
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
                        text: snap["username"],
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: "  ${snap["caption"]}",
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
                text: DateFormat.yMMMd().format(snap["postedDate"].toDate()),
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
