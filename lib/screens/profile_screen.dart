import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';
import 'package:instagram_clone_flutter_firebase/widgets/text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          text: "Username",
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
                      backgroundImage: NetworkImage(
                        "https://i.pinimg.com/236x/74/67/ac/7467acd73768ec753f20c4ac6cf39441.jpg",
                      ),
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
                              text: "Username",
                              textClr: primaryColor,
                              textSize: 14,
                              textWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              statColumn(0, "posts"),
                              statColumn(700, "followers"),
                              statColumn(365, "following"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: MyText(text: "Bio", textClr: primaryColor, textSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor.shade700,
                        minimumSize: Size(double.infinity, 32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Edit profile",
                        style: TextStyle(color: primaryColor, fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 32),
                        backgroundColor: secondaryColor.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Share profile",
                        style: TextStyle(color: primaryColor, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: MasonryGridView.builder(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 6,
                  itemBuilder:
                      (context, index) => Image.network(
                        "https://img.freepik.com/free-photo/fuji-mountain-kawaguchiko-lake-morning-autumn-seasons-fuji-mountain-yamanachi-japan_335224-102.jpg?semt=ais_hybrid&w=740&q=80",
                        fit: BoxFit.cover,
                      ),
                ),
              ),
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
