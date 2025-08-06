import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';
import 'package:instagram_clone_flutter_firebase/widgets/text.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: errorColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/236x/74/67/ac/7467acd73768ec753f20c4ac6cf39441.jpg",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: MyText(
                  text: "Username",
                  textClr: primaryColor,
                  textSize: 14,
                ),
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.network(
              fit: BoxFit.cover,
              "https://static.vecteezy.com/system/resources/thumbnails/065/785/991/small/majestic-mountain-range-reflecting-in-a-serene-river-at-sunset-in-a-tranquil-valley-photo.jpeg",
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              MyText(text: "200", textClr: primaryColor, textSize: 12),
              IconButton(onPressed: () {}, icon: Icon(Icons.messenger_outline)),
              MyText(text: "18", textClr: primaryColor, textSize: 12),
              IconButton(onPressed: () {}, icon: Icon(Icons.send)),
              MyText(text: "32", textClr: primaryColor, textSize: 12),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Username ",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: "Post caption"),
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
                text: "August 06,2025",
                textClr: primaryColor,
                textSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
